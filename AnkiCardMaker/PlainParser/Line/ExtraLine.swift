//
//  ExtraLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/6/1.
//

import Foundation

class ExtraLine: Line, LineTypeMatchable {
    static func match(by text: String, previousLine: Line?) -> Bool {
        let regex = NSRegularExpression("[+]\\s[a-zA-Z\\s]+")
        return regex.matches(text)
    }
    
    override var disposable: Bool {
        return true
    }
}
