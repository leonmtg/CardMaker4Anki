//
//  PlainElement.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/24.
//

import Foundation

protocol PlainElement {
    var text: String { get set }
            
    var formattedText: String { get }
    
    var disposable: Bool { get }
    
    mutating func parse()
}
