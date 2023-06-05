//
//  FirstLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/29.
//

import Foundation

class FirstLine: Line {
    var subElements:[PlainElement] = []

    var formattedSubTexts: [String] {
        return subElements
            .filter { !$0.disposable }
            .map { $0.formattedText }
    }
    
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
            return "**\(formattedSubTexts.joined(separator:" "))**"
        }
    }
    
    lazy var keyword: String? = {
        guard !subElements.isEmpty else {
            return nil
        }
        
        var text:String
        
        if hasType && subElements.count > 1 {
            text = formattedSubTexts[0..<(formattedSubTexts.count - 1)].joined(separator: " ")
        } else {
            text = formattedText
        }
        
        text = text.replacingOccurrences(of: "·", with: "")
        text = text.replacingOccurrences(of: "ˈ", with: "")
        
        return text
    }()
    
    init(text: String) {
        super.init(text: text, previousLine: nil)
    }
}

extension FirstLine: LineDividable {
    func divide() {
        subElements = text.components(separatedBy: .whitespaces).map {
            let word = Word(text: $0)
            return word
        }
        
        if !typeTexts.contains(self.text) {
            for type in typeTexts {
                if self.text.range(of: type) != nil {
                    hasType = true
                    break
                }
            }
        }
    }
}
