//
//  SparkFileUploadButtonStyleSnapshotTests.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 17/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentFileUpload
import SparkComponentButton
import SparkResources
import SparkTheming
import SparkTheme

@MainActor
@Suite(.sparkConfiguration)
struct SparkFileUploadButtonStyleSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test func test() async {
        await self.testView()
    }

    @Test func test_documentation() async {
        await self.testView(forDocumentation: true)
    }

    // MARK: - Private

    func testView(forDocumentation: Bool = false) async {
        let view = SparkButton("Upload file", image: Image(spark: \.export)) {
        }
            .sparkTheme(self.theme)
            .sparkButtonStyle(.fileUpload)
            .padding(.vertical, 30)
            .padding(.horizontal, 50)
            .fixedSize()
            .background(.background)

        await self.assertSnapshot(
            matching: view,
            named: forDocumentation ? "" : "button_with_fileupload_style",
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default,
            testName: forDocumentation ? "fileupload_button" : "test",
            addPadding: false,
            forDocumentation: forDocumentation
        )
    }
}
