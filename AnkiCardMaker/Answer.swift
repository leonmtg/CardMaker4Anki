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
grip verb
[ox5000][C1]
 /ɡrɪp/
 /ɡrɪp/
+ Verb Forms
hold tightly
1 [ox5000][C1] [tr ansitive, intransitive] to hold something tightly
SYNONYM grasp
grip something ‘Please don’t go,’ he said, gripping her arm.
grip on to something She gripped on to the railing with both hands.
+ Synonyms hold
+ Extra Examples
interest/excite
2 [ox5000][C1] [transitive] grip somebody/somethingto interest or have a strong effect on somebody; to hold somebody’s attention
The book grips you from start to finish.
I was totally gripped by the story.
The campaign gripped people’s imagination.
The atmosphere of the World Cup gripped the nation.
SEE ALSO gripping
have powerful effect
3 [ox5000][C1] [transitive] grip somebody/something(of an emotion or a situation) to have a powerful effect on somebody/something
I was gripped by a feeling of panic.
A sudden fear gripped me.
Terrorism has gripped the country for the past two years.
move/hold without slipping
4 [transitive, intransitive] grip (something)to hold onto or to move over a surface without slipping
tyres that grip the road
+ Word Origin
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
