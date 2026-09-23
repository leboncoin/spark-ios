//
//  SegmentedControlConfigurationSnapshotTests.swift
//  SparkComponentSegmentedControlSnapshotTests
//
//  Created by robin.lemaire on 25/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct SegmentedControlConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: SegmentedControlScenarioSnapshotTests

    var items: SegmentedControlItems = .default
    var contentType: SegmentedControlContentType = .default
    var selectedIndex: Int = 1

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.items)" + "Items",
            "\(self.contentType)" + "ContentType",
            self.selectedIndex >= 0 ? "selectedIndex\(self.selectedIndex)" : "noSelection"
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "segmentedcontrol_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum SegmentedControlItems: Int, CaseIterable {
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight

    static var `default` = Self.three

    var count: Int {
        return switch self {
        case .two: 2
        case .three: 3
        case .four: 4
        case .five: 5
        case .six: 6
        case .seven: 7
        case .eight: 8
        }
    }

    var documentationName: String? {
        return switch self {
        case .two: nil
        case .three: "three_items"
        case .four: nil
        case .five: nil
        case .six: "six_items"
        case .seven: "seven_items"
        case .eight: nil
        }
    }
}

enum SegmentedControlContentType: String, CaseIterable {
    case icon
    case text
    case iconAndText
    case label

    static var `default` = Self.text

    var documentationName: String {
        return switch self {
        case .icon: "icons"
        case .text: "texts"
        case .iconAndText: "icons_and_texts"
        case .label: "label"
        }
    }
}
