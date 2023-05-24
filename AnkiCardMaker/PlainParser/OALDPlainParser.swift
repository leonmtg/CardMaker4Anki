//
//  OALDPlainParser.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/23.
//

import Foundation

class OALDPlainParser {
    public class var standard: OALDPlainParser {
        return self.singleton
    }
    
    private static let singleton: OALDPlainParser = OALDPlainParser()
    
    public func parse(text: String) -> String {
        var entry = Entry(text: text)
        
        entry.parse()
        
        return entry.formattedText
    }
}
