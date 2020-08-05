//
//  WebView.swift
//  iOS_Demo2
//
//  Created by Uri on 7/23/20.
//  Copyright © 2020 Uri. All rights reserved.
//
import WebKit
import SwiftUI
import Foundation

struct WebView: UIViewRepresentable {
    var url: String
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
}
