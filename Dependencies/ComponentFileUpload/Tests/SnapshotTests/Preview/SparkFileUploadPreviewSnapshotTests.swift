//
//  SparkFileUploadPreviewSnapshotTests.swift
//  SparkComponentFileUploadSnapshotTests
//
//  Created by robin.lemaire on 15/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import SparkTheming
import SparkTheme

final class SparkFileUploadPreviewSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        try self.testView()
    }

    func test_with_error() throws {
        try self.testView(isSucceed: false, testName: "test.isError")
    }

    func test_documentation() throws {
        try self.testView(forDocumentation: true)
    }

    // MARK: - Private

    func testView(
        isSucceed: Bool = true,
        testName: String = #function,
        forDocumentation: Bool = false
    ) throws {
        let pdfURL = try URL.pdfMock
        let file = isSucceed ? FileUpload(
            id: "test-id",
            name: pdfURL.lastPathComponent,
            source: .files,
            result: .success(.init(
                url: pdfURL,
                data: .mock,
                fileExtension: pdfURL.pathExtension,
                size: 1024000
            ))
        ) : FileUpload(
            id: "myfile.pdf",
            source: .camera,
            error: .other(ErrorMock.value)
        )

        let view = SparkFileUploadPreview(
            file: file,
            removeAction: {}
        )
        .sparkTheme(self.theme)
        .frame(width: 500)
        .padding(.vertical, forDocumentation ? 30 : 100)
        .padding(.horizontal, 30)
        .fixedSize()
        .background(.background)

        self.assertSnapshot(
            matching: view,
            named: forDocumentation ? "" : "preview",
            modes: ComponentSnapshotTestConstants.Modes.all,
            sizes: ComponentSnapshotTestConstants.Sizes.all,
            testName: forDocumentation ? "fileupload_preview" : testName,
            forDocumentation: forDocumentation
        )
    }
}
