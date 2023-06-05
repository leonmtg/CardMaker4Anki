//
//  ExampleLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/29.
//

import Foundation

class ExampleLine: Line {
    override var formattedText: String {
        return "<span style=\"color:blue\">*\(super.formattedText)*</span>"
    }
}

extension ExampleLine: LineTypeMatchable {
    static func match(by text: String, previousLine: Line?) -> Bool {
        if let previousLine = previousLine {
            if previousLine is MeaningLine
                || (previousLine is ThesaurusLine && previousLine.previousLine is MeaningLine)
                || previousLine is ExampleLine
                && !MeaningLine.match(by: text, previousLine: previousLine) {
                return true
            }
        }
        return false
    }
}
