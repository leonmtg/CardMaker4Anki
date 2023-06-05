//
//  ExampleLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/29.
//

import Foundation

class ExampleLine: Line {
    private var phrase: String?
    private var example: String?
    
    override var formattedText: String {
        var formattedText = super.formattedText
        if let example = example, let phrase = phrase {
            formattedText = "*<b>\(phrase)</b>\(example)*"
        } else {
            formattedText = "*\(formattedText)*"
        }
        return "<span style=\"color: rgb(0, 85, 127);\">\(formattedText)</span>"
    }
}

extension ExampleLine: LineTypeMatchable {
    static func match(by text: String, previousLine: Line?, position: LinePosition) -> Bool {
        if let previousLine = previousLine {
            if previousLine is MeaningLine
                || (previousLine is ThesaurusLine && previousLine.previousLine is MeaningLine)
                || previousLine is ExampleLine
                && !MeaningLine.match(by: text, previousLine: previousLine, position: position) {
                return true
            }
            if position >= .phrases
                && (previousLine is PhraseMeaningLine || previousLine is ExampleLine)
                && !(PhraseMeaningLine.match(by: text, previousLine: previousLine, position: position)) {
                return true
            }
                
        }
        return false
    }
}

extension ExampleLine: LineDividable {
    func divide() {
        let regex = /[A-Z]/
        
        if let match = text.firstMatch(of: regex) {
            example = String(text[match.startIndex...])
            if example != text {
                phrase = String(text[..<match.startIndex])
            }
        }
    }
}
