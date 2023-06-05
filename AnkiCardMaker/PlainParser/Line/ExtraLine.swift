//
//  ExtraLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/6/1.
//

import Foundation

class ExtraLine: Line {
    override var disposable: Bool {
        return true
    }
}

extension ExtraLine: LineTypeMatchable {
    static func match(by text: String, previousLine: Line?, position: LinePosition) -> Bool {
        let regex = /[+]\s[a-zA-Z\s]+/
        return text.wholeMatch(of: regex) != nil
    }
}
