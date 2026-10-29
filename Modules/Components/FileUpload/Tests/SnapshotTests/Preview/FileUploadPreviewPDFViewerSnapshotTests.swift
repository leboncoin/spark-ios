//
//  FileUploadPreviewPDFViewerSnapshotTests.swift
//  SparkComponentFileUploadSnapshotTests
//
//  Created by robin.lemaire on 15/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import SparkTheming
import SparkTheme

@MainActor
@Suite(.sparkConfiguration)
struct FileUploadPreviewPDFViewerSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test func test() async throws {
        let pdfURL = try URL.pdfMock

        let view = FileUploadPreviewPDFViewer(url: pdfURL)
            .sparkTheme(self.theme)
            .frame(width: 300, height: 400)
            .background(.background)

        await self.assertSnapshot(
            matching: view,
            named: "pdf_viewer",
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default,
            addPadding: false
        )
    }
}
