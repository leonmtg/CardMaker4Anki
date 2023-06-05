//
//  PhraseTitleLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/6/5.
//

import Foundation

class PhraseTitleLine: Line {
    
}

extension PhraseTitleLine: LineTypeMatchable {
    static func match(by text: String, previousLine: Line?, position: LinePosition) -> Bool {
        let regex = /Idioms|Phrasal Verbs/
        return text.wholeMatch(of: regex) != nil
    }
}
