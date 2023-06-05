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
        return self.text
    }
    
    var disposable: Bool {
        return false
    }
    
    var previousLine: Line? = nil
    
    class func lineFactory(text: String, previousLine: Line?) -> Line {
        if let previousLine = previousLine {
            if PronunciationLine.match(by: text, previousLine: previousLine) {
                return PronunciationLine(text: text, previousLine: previousLine)
            }
            if ExtraLine.match(by: text, previousLine: previousLine) {
                return ExtraLine(text: text, previousLine: previousLine)
            }
            if ThesaurusLine.match(by: text, previousLine: previousLine) {
                return ThesaurusLine(text: text, previousLine: previousLine)
            }
            if ImportanceLine.match(by: text, previousLine: previousLine) {
                return ImportanceLine(text: text, previousLine: previousLine)
            }
            if MeaningLine.match(by: text, previousLine: previousLine) {
                return MeaningLine(text: text, previousLine: previousLine)
            }
            if ExampleLine.match(by: text, previousLine: previousLine) {
                return ExampleLine(text: text, previousLine: previousLine)
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
}
