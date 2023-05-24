//
//  PlainElement.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/24.
//

import Foundation

protocol PlainElement {
    var text: String { get }
    
    var subElements: [PlainElement] { get }
    
    var formattedText: String { get }
    
    func divide(text: String) 
}
