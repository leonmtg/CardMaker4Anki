//
//  PhraseMeaningLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/6/5.
//

import Foundation

class PhraseMeaningLine: Line {
    
}

extension PhraseMeaningLine: LineTypeMatchable {
    static func match(by text: String, previousLine: Line?, position: LinePosition) -> Bool {
        if position >= .phrases {
            if previousLine is PhraseLine {
                return true
            } else {
                let regex = /\d{1,2}\s[\[\w]{2,3}.+/
                return text.wholeMatch(of: regex) != nil
            }
        }
        return false
    }
}
