//
//  SparkFileUploadDropzoneSnapshotTests.swift
//  SparkComponentFileUploadSnapshotTests
//
//  Created by robin.lemaire on 28/04/2026.
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
import SparkComponentButton
import SparkResources
import SparkTheming
import SparkTheme

final class SparkFileUploadDropzoneSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared
    @State var files: [FileUpload] = []

    // MARK: - Tests

    func test() {
        let scenarios = FileUploadDropzoneScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .frame(width: 400)
                    .padding(.vertical, 100)
                    .padding(.horizontal, 30)
                    .fixedSize()
                    .background(.background)

                self.assertSnapshot(
                    matching: view,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName,
                    forDocumentation: scenario.isDocumentation
                )
            }
        }
    }

    @ViewBuilder
    private func component(configuration: FileUploadDropzoneConfigurationSnapshotTests) -> some View {
        switch configuration.contentType {
        case .native:
            self.componentWithNativeContent(
                configuration: configuration
            )

        case .custom:
            self.componentWithCustomContent(
                configuration: configuration
            )

        case .none:
            self.componentWithButtonOnly(
                configuration: configuration
            )
        }
    }

    @ViewBuilder
    private func componentWithNativeContent(
        configuration: FileUploadDropzoneConfigurationSnapshotTests
    ) -> some View {
        SparkFileUploadDropzone(
            icon: configuration.hasIcon ? Image(spark: \.export) : nil,
            descriptionText: "Drag and drop a file or",
            additionalText: ".png, .jpg up to 5MB",
            files: self.$files
        ) {
            FileUploadButton(files: self.files)
        }
    }

    @ViewBuilder
    private func componentWithCustomContent(
        configuration: FileUploadDropzoneConfigurationSnapshotTests
    ) -> some View {
        SparkFileUploadDropzone(
            icon: configuration.hasIcon ? Image(spark: \.export) : nil,
            files: self.$files,
            descriptionLabel: {
                CustomDescriptionLabel()
            },
            uploadButton: {
                FileUploadButton(files: self.files)
            },
            additionalLabel: {
                CustomAdditionalLabel()
            }
        )
    }

    @ViewBuilder
    private func componentWithButtonOnly(
        configuration: FileUploadDropzoneConfigurationSnapshotTests
    ) -> some View {
        SparkFileUploadDropzone(
            icon: configuration.hasIcon ? Image(spark: \.export) : nil,
            files: self.$files
        ) {
            FileUploadButton(files: self.files)
        }
    }
}

// MARK: - Custom Labels

private struct FileUploadButton: View {

    @State var files: [FileUpload] = []

    var body: some View {
        SparkFileUploadButton(
            "Browse my files",
            files: self.$files
        )
    }
}

private struct CustomDescriptionLabel: View {
    var body: some View {
        HStack(spacing: 4) {
            Text("Drag and drop")
                .bold()
                .foregroundStyle(.red)
            Text("or")
        }
    }
}

private struct CustomAdditionalLabel: View {
    var body: some View {
        HStack(spacing: 4) {
            Text(".png, .jpg up ")
            Text("to 5MB")
                .bold()
                .foregroundStyle(.red)
        }
    }
}
