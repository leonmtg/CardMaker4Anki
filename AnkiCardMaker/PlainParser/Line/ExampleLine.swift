//
//  ExampleLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/29.
//

import Foundation

class ExampleLine: Line, LineTypeMatchable {
    static func match(by text: String, previousLine: Line?) -> Bool {
        false
    }
}
