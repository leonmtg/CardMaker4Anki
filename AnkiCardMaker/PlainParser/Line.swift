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
        
        return formattedSubTexts
            .joined(separator: " ")
    }
    
    var disposable: Bool {
        if subElements.allSatisfy({ $0.disposable }) {
            return true
        }

        return false
    }
    
    var previousLine: Line? = nil
    
    var subElements:[PlainElement] = []
    
    var formattedSubTexts: [String] {
        return subElements
            .filter { !$0.disposable }
            .map { $0.formattedText }
    }
    
    class func lineFactory(text: String, previousLine: Line?) -> Line {
        if let previousLine = previousLine {
            var regex = NSRegularExpression("[\\/]\\D+[\\/]")
            if regex.matches(text) {
                return PronunciationLine(text: text, previousLine: previousLine)
            }
            regex = NSRegularExpression("[+]\\s[a-zA-Z\\s]+")
            if regex.matches(text) {
                return ExtraLine(text: text, previousLine: previousLine)
            }
            
            return MiscsLine(text: text, previousLine: previousLine)
        } else {
            return FirstLine(text: text)
        }
    }
    
    init(text: String, previousLine: Line?) {
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
