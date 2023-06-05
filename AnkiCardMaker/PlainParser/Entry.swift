//
//  Entry.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/24.
//

import Foundation

enum LinePosition: Int, Comparable {
    case header = 1
    case wordMeanings
    case phrases
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

struct Entry: PlainElement {
    var text: String
    
    var formattedText: String {
        guard !subElements.isEmpty else {
            return ""
        }
        
        let filteredElements = subElements.filter { !$0.disposable }
        var insertedFormatedText:[String] = []
        var hasMeaningGroup = false
        
        for line in filteredElements {
            if line is MiscsLine {
                insertedFormatedText.append(" ")
                hasMeaningGroup = true
            }
            
            if !hasMeaningGroup && line is MeaningLine {
                insertedFormatedText.append(" ")
            }
            
            if line is PhraseTitleLine {
                insertedFormatedText.append(" ")
            }
            
            insertedFormatedText.append(line.formattedText)
        }

        return insertedFormatedText.joined(separator: "<br />")
    }
    
    var disposable: Bool {
        return false
    }
    
    private var subElements: [Line] = []
    private var firstLine: FirstLine?
    
    var keyword: String? {
        return firstLine?.keyword
    }
    
    init(text: String) {
        self.text = text
    }
    
    mutating func parse() {
        guard !text.isEmpty else {
            return
        }
        
        var position: LinePosition = .header
        var prev: Line? = nil
        let elements = text.components(separatedBy: .newlines).map {
            
            let line = Line.lineFactory(text: $0, previousLine: prev, position: position)
            if let firstLine = line as? FirstLine {
                self.firstLine = firstLine
            }
            prev = line
            
            if let line = line as? LineDividable {
                line.divide()
            }
            
            if position == .header && line is MeaningLine {
                position = .wordMeanings
            } else if position <= .wordMeanings && line is PhraseTitleLine {
                position = .phrases
            }
            
            return line
        }
        
        var checkedElements:[Line] = []
        for (index, line) in elements.enumerated() {
            if let prev = line.previousLine as? ExampleLine, line is MeaningLine {
                if !prev.text.contains(self.keyword!)
//                    && prev.subElements.count < 4
                    && prev.text.firstMatch(of: /[A-Z]/) == nil {
                    let newLine = MiscsLine(text: prev.text, previousLine: prev.previousLine)
                    checkedElements[index - 1] = newLine
                }
            }
            checkedElements.append(line)
        }
        
        self.subElements = checkedElements
        self.subElements.forEach { line in
            print("\(type(of: line))" + " " + line.text)
        }
    }
}
