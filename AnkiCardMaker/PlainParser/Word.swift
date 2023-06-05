//
//  Word.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/24.
//

import Foundation


struct Word: PlainElement {
    let disposableTexts = [
        "[OX3000]",
        "[ox5000]",
        "[A1]",
        "[A2]",
        "[B1]",
        "[B2]",
        "[C1]",
        "[C2]"
    ]
    
    var text: String
        
    var formattedText: String {
        return text
    }
    
    var disposable: Bool {
        if disposableTexts.contains(self.text) {
            return true
        }
        return false
    }
}
