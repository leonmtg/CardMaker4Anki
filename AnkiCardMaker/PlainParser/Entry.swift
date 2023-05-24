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
        
        return subElements.map { $0.formattedText }.joined(separator: "<br />")
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
