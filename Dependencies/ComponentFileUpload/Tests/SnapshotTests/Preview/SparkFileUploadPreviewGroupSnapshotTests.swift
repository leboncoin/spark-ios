//
//  SparkFileUploadPreviewGroupSnapshotTests.swift
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

final class SparkFileUploadPreviewGroupSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        try self.testView()
    }

    func test_documentation() throws {
        try self.testView(forDocumentation: true)
    }

    // MARK: - Private

    func testView(forDocumentation: Bool = false) throws {
        let pdfURL = try URL.pdfMock
        let imageURL = try URL.imageMock
        let txtURL = try URL.txtMock

        let files: [FileUpload] = [
            FileUpload(
                id: "file-1",
                name: pdfURL.lastPathComponent,
                source: .files,
                result: .success(.init(
                    url: pdfURL,
                    data: .mock,
                    fileExtension: pdfURL.pathExtension,
                    size: 1024000
                ))
            ),
            FileUpload(
                id: "file-2",
                name: imageURL.lastPathComponent,
                source: .photos,
                result: .success(.init(
                    url: imageURL,
                    data: .mock,
                    fileExtension: imageURL.pathExtension,
                    size: 2048000
                ))
            ),
            FileUpload(
                id: "file-3",
                name: txtURL.lastPathComponent,
                source: .drop,
                result: .success(.init(
                    url: txtURL,
                    data: .mock,
                    fileExtension: txtURL.pathExtension,
                    size: 512
                ))
            )
        ]

        let view = SparkFileUploadPreviewGroup(
            files: .constant(files)
        )
        .sparkTheme(self.theme)
        .frame(width: 300)
        .padding(.vertical, 50)
        .padding(.horizontal, 30)
        .fixedSize()
        .background(.background)

        self.assertSnapshot(
            matching: view,
            named: forDocumentation ? "" : "preview_group",
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default,
            testName: forDocumentation ? "fileupload_preview_group" : "test",
            forDocumentation: forDocumentation
        )
    }
}
