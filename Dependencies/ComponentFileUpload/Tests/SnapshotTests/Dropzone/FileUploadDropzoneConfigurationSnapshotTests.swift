//
//  FileUploadDropzoneConfigurationSnapshotTests.swift
//  SparkComponentFileUploadSnapshotTests
//
//  Created by robin.lemaire on 28/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct FileUploadDropzoneConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: FileUploadDropzoneScenarioSnapshotTests

    var hasIcon: Bool = true
    var contentType: FileUploadDropzoneContentType = .default

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        let parts: [String] = [
            self.hasIcon ? "withIcon" : nil,
            self.contentType.name(for: "description"),
            self.contentType.name(for: "additional")
        ].compactMap { $0 }

        return parts
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "fileupload_dropzone_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum FileUploadDropzoneContentType: String, CaseIterable {
    case native
    case custom
    case none

    static var `default` = Self.native

    func name(for value: String) -> String? {
        switch self {
        case .native: value
        case .custom: value + "Custom"
        case .none: nil
        }
    }
}

