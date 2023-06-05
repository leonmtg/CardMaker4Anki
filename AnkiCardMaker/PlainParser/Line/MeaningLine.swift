//
//  MeaningLine.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/29.
//

import Foundation

class MeaningLine: Line {
    override var formattedText: String {
        return "<span style=\"color:green\">\(super.formattedText)</span>"
    }
}

extension MeaningLine: LineTypeMatchable {
    static func match(by text: String, previousLine: Line?) -> Bool {
        let regex = /\d{1,2}\s[\[\w]{2,3}.+/
        return text.wholeMatch(of: regex) != nil
    }
}

extension MeaningLine: LineDividable {
    func divide() {
        // TODO: !!!
    }
}
