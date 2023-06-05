//
//  MeaningLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/29.
//

import Foundation

class MeaningLine: Line {
    var subElements:[PlainElement] = []

    var formattedSubTexts: [String] {
        return subElements
            .filter { !$0.disposable }
            .map { $0.formattedText }
    }
    
    override var formattedText: String {
        return "<span style=\"color:black\">\(formattedSubTexts.joined(separator:" "))</span>"
    }
}

extension MeaningLine: LineTypeMatchable {
    static func match(by text: String, previousLine: Line?, position: LinePosition) -> Bool {
        let regex = /\d{1,2}\s[\[\w]{2,3}.+/
        return text.wholeMatch(of: regex) != nil
    }
}

extension MeaningLine: LineDividable {
    func divide() {
        var text = text.replacingOccurrences(of: "][", with: "] [")
        text = text.replacingOccurrences(of: "somethingto", with: "something to")
        text = text.replacingOccurrences(of: "somebodyto", with: "somebody to")
        text = text.replacingOccurrences(of: "something)to", with: "something) to")
        text = text.replacingOccurrences(of: "somebody)to", with: "somebody) to")
        text = text.replacingOccurrences(of: "prep.to", with: "prep. to")
        text = text.replacingOccurrences(of: "adv.to", with: "adv. to")
        
        subElements = text.components(separatedBy: .whitespaces).map {
            let word = Word(text: $0)
            return word
        }
    }
}
