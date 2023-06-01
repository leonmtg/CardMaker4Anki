//
//  PronunciationLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/6/1.
//

import Foundation

class PronunciationLine: Line {
    override var disposable: Bool {
        if self.text == self.previousLine?.text {
            return true
        } else {
            return false
        }
    }
}
