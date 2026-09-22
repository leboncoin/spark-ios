//
//  FileUploadPreviewPDFViewer.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 03/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import PDFKit

struct FileUploadPreviewPDFViewer: View {

    // MARK: - Properties

    let url: URL

    // MARK: - View

    var body: some View {
        PDFKitViewRepresentable(url: self.url)
    }
}

// MARK: - View Representable

private struct PDFKitViewRepresentable: UIViewRepresentable {

    // MARK: - Properties

    let url: URL

    // MARK: - View

    func makeUIView(context: UIViewRepresentableContext<PDFKitViewRepresentable>) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: self.url)
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<PDFKitViewRepresentable>) {
    }
}
