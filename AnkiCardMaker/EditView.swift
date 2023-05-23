//
//  EditView.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/23.
//

import SwiftUI

struct EditView: View {
    @State private var answer = Answer()
    
    var body: some View {
        HSplitView {
            TextEditor(text: $answer.text)
                .frame(minWidth: 200)
                .font(.system(size: 14))
            WebView(html: answer.html)
                .frame(minWidth: 200)
        }
        .frame(minWidth: 400, idealWidth: 600, maxWidth: .infinity,
               minHeight: 300, idealHeight: 400, maxHeight: .infinity)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
