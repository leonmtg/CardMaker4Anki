//
//  ThesaurusLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/6/1.
//

import Foundation

class ThesaurusLine: Line, LineTypeMatchable {
    static func match(by text: String, previousLine: Line?) -> Bool {
        let regex = /(SYNONYM|OPPOSITE|(SEE ALSO))\s(\w|\s)+\s?(\(\d+\))?/
        return text.wholeMatch(of: regex) != nil
    }
    
    override var formattedText: String {
        return "<span style=\"color:purple\">\(super.formattedText)</span>"
    }
}
