//
//  CardConfigurationSnapshotTests.swift
//  SparkComponentCardSnapshotTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct CardConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: CardScenarioSnapshotTests

    var intent: CardIntent = .default
    var isHighlighted: Bool = false
    var padding: CardPadding = .default
    var variant: CardVariant = .default
    var headerPosition: CardHeaderPosition = .default
    var headerContentType: CardHeaderContentType = .default
    var isElevation: Bool = false
    var isDisabled: Bool = false

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        let headerName: String? = if let name = self.headerContentType.name {
            "\(self.headerPosition)\(name.capitalized)Header"
        } else {
            nil
        }

        return [
            "\(self.intent)" + "Intent",
            self.isHighlighted ? "highlighted" : nil,
            "\(self.padding)" + "Padding",
            "\(self.variant)" + "Variant",
            headerName,
            self.isElevation ? "elevated" : nil,
            self.isDisabled ? "disabled" : nil
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "card_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum CardHeaderContentType: String, CaseIterable {
    case native
    case custom
    case none

    static var `default` = Self.none

    var name: String? {
        switch self {
        case .native: self.rawValue
        case .custom: self.rawValue
        case .none: nil
        }
    }
}

