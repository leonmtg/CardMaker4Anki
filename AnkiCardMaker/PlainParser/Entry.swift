//
//  Entry.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/24.
//

import Foundation

struct Entry: PlainElement {
    var text: String
    
    var formattedText: String {
        guard !subElements.isEmpty else {
            return ""
        }
        
        return subElements
            .filter { !$0.disposable }
            .map { $0.formattedText }.joined(separator: "<br />")
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
        
        var prev: Line? = nil
        let elements = text.components(separatedBy: .newlines).map {
            let line = Line.lineFactory(text: $0, previousLine: prev)
            if let firstLine = line as? FirstLine {
                self.firstLine = firstLine
            }
            prev = line
            
            print("\(type(of: line))" + " " + line.text)
            line.parse()
            
            return line
        }
        
        var checkedElements:[Line] = []
        for (index, line) in elements.enumerated() {
            if let prev = line.previousLine as? ExampleLine, line is MeaningLine {
                if !prev.text.contains(self.keyword!)
                    && prev.subElements.count < 4
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
//            line.parse()
        }
    }
}
