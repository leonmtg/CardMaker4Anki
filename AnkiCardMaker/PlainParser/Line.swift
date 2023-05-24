//
//  Line.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/24.
//

import Foundation

struct Line: PlainElement {
    var text: String
    
    var formattedText: String {
        guard !subElements.isEmpty else {
            return ""
        }
        
        return subElements.map { $0.formattedText }.joined(separator: " ")
    }
    
    var subElements:[PlainElement] = []
    
    mutating func parse() {
        guard !text.isEmpty else {
            return
        }
        
        subElements = text.components(separatedBy: .whitespaces).map {
            var word = Word(text: $0)
            word.parse()
            return word
        }
    }
}
