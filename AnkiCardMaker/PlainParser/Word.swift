//
//  Word.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/24.
//

import Foundation


struct Word: PlainElement {
    let disposableTexts = [
        "[ox5000]",
        "[C1]"
    ]
    
    var text: String
    
    var formattedText: String {
        return text
    }
    
    var disposable: Bool {
        if disposableTexts.contains(text) {
            return true
        }
        return false
    }
    
    mutating func parse() {
        guard !text.isEmpty else {
            return
        }
    }
}
