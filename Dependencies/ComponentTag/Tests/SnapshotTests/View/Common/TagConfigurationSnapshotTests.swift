//
//  TagConfigurationSnapshotTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 05/05/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting

struct TagConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: TagScenarioSnapshotTests

    var intent: TagIntent = .default
    var size: TagSize = .default
    var variant: TagVariant = .default
    var isHighlighted: Bool = false
    var content: TagContentResilience = .default
    var isIcon: Bool = true
    var width: CGFloat? {
        return self.content == .longLabel ? 100 : nil
    }
    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Getter

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.scenario.rawValue)",
            "\(self.intent)",
            "\(self.size)",
            "\(self.variant)",
            self.isHighlighted ? "isHighlighted" : nil,
            "\(self.content.rawValue)",
            self.isIcon ? "isIcon" : nil,
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "tag_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum TagContentResilience: String, CaseIterable {
    case withoutLabel
    case label
    case longLabel
    case other

    static var `default` = Self.label

    var text: String? {
        switch self {
        case .withoutLabel: nil
        case .label: "My Text"
        case .longLabel: "Very very long long tag"
        case .other: nil
        }
    }
}
