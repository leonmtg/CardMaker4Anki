//
//  WebView.swift
//  AnkiCardMaker
//
//  Created by Leon on 2023/5/23.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    var html: String
    
    private var formattedHtml: String {
      return """
          <html>
          <body>
             \(html)
          </body>
          </html>
          """
    }
    
    init(html: String) {
        self.html = html
    }
    
    func makeNSView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        nsView.loadHTMLString(
            formattedHtml,
            baseURL: Bundle.main.resourceURL
        )
    }
}
