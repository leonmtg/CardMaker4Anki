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
    
    class func lineFactory(text: String, previousLine: Line?, position: LinePosition) -> Line {
        if let previousLine = previousLine {
            if PhraseTitleLine.match(by: text, previousLine: previousLine, position: position) {
                return PhraseTitleLine(text: text, previousLine: previousLine)
            }
            if PronunciationLine.match(by: text, previousLine: previousLine, position: position) {
                return PronunciationLine(text: text, previousLine: previousLine)
            }
            if ExtraLine.match(by: text, previousLine: previousLine, position: position) {
                return ExtraLine(text: text, previousLine: previousLine)
            }
            if ThesaurusLine.match(by: text, previousLine: previousLine, position: position) {
                return ThesaurusLine(text: text, previousLine: previousLine)
            }
            if ImportanceLine.match(by: text, previousLine: previousLine, position: position) {
                return ImportanceLine(text: text, previousLine: previousLine)
            }
            if PhraseLine.match(by: text, previousLine: previousLine, position: position) {
                return PhraseLine(text: text, previousLine: previousLine)
            }
            if PhraseMeaningLine.match(by: text, previousLine: previousLine, position: position) {
                return PhraseMeaningLine(text: text, previousLine: previousLine)
            }
            if MeaningLine.match(by: text, previousLine: previousLine, position: position) {
                return MeaningLine(text: text, previousLine: previousLine)
            }
            if ExampleLine.match(by: text, previousLine: previousLine, position: position) {
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
