//
//  ImportanceLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/6/5.
//

import Foundation

class ImportanceLine: Line {
    override var disposable: Bool {
        return true
    }
}

extension ImportanceLine: LineTypeMatchable {
    static func match(by text: String, previousLine: Line?) -> Bool {
        if text.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }
        let regex = /(\[OX3000\]|\[ox5000\]|\[OPAL W\]|\[OPAL S\]|\[A1\]|\[A2\]|\[B1\]|\[B2\]|\[C1\]|\[C2\]|\s)+/
        return text.wholeMatch(of: regex) != nil
    }
}
