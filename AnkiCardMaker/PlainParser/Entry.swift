//
//  Entry.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/24.
//

import Foundation

struct Entry: PlainElement {
    var text: String
    
    var formattedText: String {
        guard !subElements.isEmpty else {
            return ""
        }
        
        var prev: PlainElement?
        return subElements
            .filter { element in
                defer {
                    prev = element
                }
                return (element.text != prev?.text) && !element.disposable
            }
//            .filter { !$0.disposable }
            .map { $0.formattedText }.joined(separator: "<br />")
    }
    
    var disposable: Bool {
        return false
    }
    
    var subElements: [PlainElement] = []
    
    mutating func parse() {
        guard !text.isEmpty else {
            return
        }
        
        subElements = text.components(separatedBy: .newlines).map {
            var line = Line(text: $0)
            line.parse()
            return line
        }
    }
}
