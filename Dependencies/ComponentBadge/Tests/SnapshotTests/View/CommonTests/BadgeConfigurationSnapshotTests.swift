//
//  BadgeConfigurationSnapshotTests.swift
//  SparkComponentBadgeSnapshotTests
//
//  Created by robin.lemaire on 24/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct BadgeConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: BadgeScenarioSnapshotTests

    var intent: BadgeIntent = .default
    var size: BadgeSize = .default
    var content: BadgeContent = .default
    var isBorder: Bool = false
    var attachPosition: BadgePosition?

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        let attachPosition: String? = if let attachPosition {
            "\(attachPosition)" + "Position"
        } else {
            nil
        }

        return [
            "\(self.intent)" + "Intent",
            "\(self.size)" + "Variant",
            "\(self.content)" + "Content",
            self.isBorder ? "withBorder" : nil,
            "\(self.content)" + "Content",
            attachPosition
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "badge_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum BadgeContent: String, CaseIterable {
    case withoutValue
    case value
    case littleValue
    case bigValue
    case unit
    case valueAndUnit
    case bigValueAndUnit

    static var `default` = Self.value

    var value: Int? {
        switch self {
        case .value, .valueAndUnit: 49
        case .littleValue: 4
        case .bigValue, .bigValueAndUnit: 105
        default: nil
        }
    }

    var unit: String? {
        switch self {
        case .unit, .valueAndUnit, .bigValueAndUnit: "k"
        default: nil
        }
    }

    var documentationName: String {
        switch self {
        case .withoutValue, .unit: "without_value"
        case .valueAndUnit, .bigValueAndUnit: "with_unit"
        default: "with_value"
        }
    }
}
