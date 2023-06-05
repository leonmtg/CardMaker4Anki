//
//  PhraseLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/6/5.
//

import Foundation

class PhraseLine: Line {
    override var formattedText: String {
        return "**\(super.formattedText)**"
    }
}

extension PhraseLine: LineTypeMatchable {
    static func match(by text: String, previousLine: Line?, position: LinePosition) -> Bool {
        if position < .phrases {
            return false
        }
        if previousLine is PhraseTitleLine {
            return true
        }
        if text.firstMatch(of: /[ˌˈ↔]/) != nil && text.firstMatch(of: /\s+/) != nil {
            return true
        }
        
        return false
    }
}
