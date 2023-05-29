//
//  Line.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/24.
//

import Foundation

class Line: PlainElement {
    var text: String
    
    var formattedText: String {
        guard !subElements.isEmpty else {
            return ""
        }
        
        return subElements
            .filter { !$0.disposable }
            .map { $0.formattedText }.joined(separator: " ")
    }
    
    var disposable: Bool {
        if text == previousLine?.text {
            return true
        }
        if subElements.allSatisfy({ $0.disposable }) {
            return true
        }
        if subElements.count > 1 && subElements.first?.text == "+" {
            return true
        }
        return false
    }
    
    var previousLine: Line? = nil
    
    private var subElements:[PlainElement] = []
    
    init(text: String, previousLine: Line? = nil) {
        self.text = text
        self.previousLine = previousLine
    }
    
    func parse() {
        guard !text.isEmpty else {
            return
        }

        var text = text.replacingOccurrences(of: "][", with: "] [")
        text = text.replacingOccurrences(of: "[OPAL W]", with: "[OPAL_W]")
        text = text.replacingOccurrences(of: "[OPAL S]", with: "[OPAL_S]")
        
        subElements = text.components(separatedBy: .whitespaces).map {
            var word = Word(text: $0)
            word.parse()
            return word
        }
    }
}
