//
//  DividerConfigurationSnapshotTests.swift
//  SparkComponentDividerSnapshotTests
//
//  Created by robin.lemaire on 18/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentDivider
@_spi(SI_SPI) import SparkComponentDividerTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct DividerConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: DividerScenarioSnapshotTests

    var alignment: DividerAlignment = .default
    var axis: DividerAxis = .default
    var intent: DividerIntent = .default
    var content: DividerContent = .default

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.alignment)" + "Alignment",
            "\(self.axis)" + "Axis",
            "\(self.intent)" + "Intent",
            "\(self.content)" + "Content"
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "divider_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum DividerContent: String, CaseIterable {
    case withoutText
    case text
    case other

    static var `default` = Self.text

    var text: String? {
        switch self {
        case .withoutText: nil
        case .text: "My component"
        case .other: nil
        }
    }

    var documentationName: String {
        switch self {
        case .text: "with_text"
        case .other: "with_label"
        default: "without_text"
        }
    }
}
