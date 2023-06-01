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
        
        return subElements
            .filter { !$0.disposable }
            .map { $0.formattedText }.joined(separator: "<br />")
    }
    
    var disposable: Bool {
        return false
    }
    
    private var subElements: [PlainElement] = []
    private var firstLine: FirstLine?
    
    var keyword: String? {
        return firstLine?.keyword
    }
    
    init(text: String) {
        self.text = text
    }
    
    mutating func parse() {
        guard !text.isEmpty else {
            return
        }
        
        var prev: Line? = nil
        subElements = text.components(separatedBy: .newlines).map {

            let line = Line.lineFactory(text: $0, previousLine: prev)
            
            line.parse()
            prev = line
            
            return line
        }
    }
}
