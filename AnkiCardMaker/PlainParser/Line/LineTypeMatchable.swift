//
//  LineTypeMatchable.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/6/1.
//

import Foundation

protocol LineTypeMatchable {
    static func match(by text: String, previousLine: Line?, position: LinePosition) -> Bool
}
