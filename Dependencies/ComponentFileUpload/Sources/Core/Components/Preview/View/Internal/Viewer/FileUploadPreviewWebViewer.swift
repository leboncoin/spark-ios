//
//  FileUploadPreviewWebViewer.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 31/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import WebKit

struct FileUploadPreviewWebViewer: View {

    // MARK: - Properties

    let url: URL

    // MARK: - View

    var body: some View {
        if #available(iOS 26.0, *) {
            WebView(url: self.url)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            WebViewRepresentable(url: self.url)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// MARK: - View Representable

private struct WebViewRepresentable: UIViewRepresentable {

    // MARK: - Properties

    let url: URL

    // MARK: - View

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: self.url)
        webView.load(request)
    }
}
