//
//  PronunciationLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/6/1.
//

import Foundation

class PronunciationLine: Line, LineTypeMatchable {
    static func match(by text: String, previousLine: Line?) -> Bool {
        let regex = NSRegularExpression("[\\/]\\D+[\\/]")
        return regex.matches(text)
    }
    
    override var disposable: Bool {
        if self.text == self.previousLine?.text {
            return true
        } else {
            return false
        }
    }
}
