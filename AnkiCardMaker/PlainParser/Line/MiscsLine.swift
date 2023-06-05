//
//  MiscsLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/6/1.
//

import Foundation

class MiscsLine: Line {
    override var disposable: Bool {
        return false
    }
    
    override var formattedText: String {
        return "*\(super.formattedText)*"
    }
}
