//
//  Meaning.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/29.
//

import Foundation

struct Meaning {
    var keyword: String
    var index: Int
}

extension Meaning: Equatable {
    static func == (lhs: Meaning, rhs: Meaning) -> Bool {
        return lhs.keyword == rhs.keyword
        && lhs.index == rhs.index
    }
}


