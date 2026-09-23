//
//  SnackbarScenarioConfiguration.swift
//  SparkComponentSnackbarSnapshotTests
//
//  Created by robin.lemaire on 18/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentSnackbar
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct SnackbarScenarioConfiguration {

    // MARK: - Properties

    let scenario: SnackbarScenario

    var intent: SnackbarIntent = .default
    var alignment: SnackbarAlignment = .default
    var titleContent: SnackbarTitleContent = .default
    var descriptionContent: SnackbarDescriptionContent = .default
    var hasButton: Bool = false
    var hasIcon: Bool = false

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.intent)" + "Intent",
            "\(self.alignment)" + "Alignment",
            "\(self.titleContent)" + "TitleContent",
            "\(self.descriptionContent)" + "DescriptionContent",
            self.hasButton ? "withButton" : "withoutButton",
            self.hasIcon ? "withIcon" : "withoutIcon"
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "snackbar_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum SnackbarTitleContent: String, CaseIterable {
    case none
    case text
    case label

    static var `default` = Self.text
}

enum SnackbarDescriptionContent: String, CaseIterable {
    case text
    case label

    static var `default` = Self.text
}
