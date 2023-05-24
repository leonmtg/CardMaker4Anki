//
//  Word.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/24.
//

import Foundation

struct Word: PlainElement {
    var text: String
    
    var formattedText: String {
        return text
    }
    
    mutating func parse() {
        guard !text.isEmpty else {
            return
        }
    }
}
