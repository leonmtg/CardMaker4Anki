//
//  FirstLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/29.
//

import Foundation

class FirstLine: Line {
    let typeTexts = [
        "noun",
        "verb",
        "adjective",
        "preposition",
        "adverb",
        "conjunction",
        "abbreviation"
    ]
    
    private var hasType = false
    
    override var formattedText: String {
        guard !subElements.isEmpty else {
            return ""
        }
        
        if hasType && subElements.count > 1 {
            let boldText = formattedSubTexts[0..<(formattedSubTexts.count - 1)].joined(separator: " ")
            return "**\(boldText)**" + " " + formattedSubTexts.last!
        } else {
            return "**\(super.formattedText)**"
        }
    }
    
    override func parse() {
        super.parse()
        
        if !typeTexts.contains(self.text) {
            for type in typeTexts {
                if let range = self.text.range(of: type) {
                    hasType = true
                    break
                }
            }
        }
    }
}
