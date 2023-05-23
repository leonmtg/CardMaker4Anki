//
//  Answer.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/23.
//

import SwiftUI
import MarkdownKit

struct Answer {
    static let mockText = """
rug noun
 /rʌɡ/
 /rʌɡ/
1 a piece of thick material like a small carpet that is used for covering or decorating part of a floor
a hearth rug (= in front of a fireplace)
an oriental rug
a sheepskin rug
A Persian rug covered the polished floor.
There were several brightly coloured rugs scattered around.
 
2 (British English) a piece of thick warm material, like a blanket, that is used for wrapping around your legs to keep warm
a travel rug
a tartan rug
3 (informal, humorous) a toupee (= a small section of artificial hair, worn by a man to cover an area of his head where hair no longer grows)
+ Word Origin
Idioms
pull the rug (out) from under somebody’s ˈfeet
 (informal) to take help or support away from somebody suddenly
sweep something under the ˈcarpet
 North American English also sweep something under the ˈrug
to try to stop people from finding out about something wrong, illegal, embarrassing, etc. that has happened or that you have done
An earlier report, implicating the government, had been conveniently swept under the carpet.
"""
    
    var text: String
    
    
    var html: String {
        let markdown = MarkdownParser.standard.parse(text)
        return HtmlGenerator.standard.generate(doc: markdown)
    }
    
    init(text: String = mockText) {
        self.text = text
    }
}
