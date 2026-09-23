//
//  SegmentedGaugeConfigurationSnapshotTests.swift
//  SparkComponentSegmentedGaugeSnapshotTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkComponentSegmentedGaugeTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct SegmentedGaugeConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: SegmentedGaugeScenarioSnapshotTests

    var alignment: SegmentedGaugeAlignment = .default
    var withMarker: Bool = true
    var segments: SegmentedGaugeSegments = .default
    var size: SegmentedGaugeSize = .default
    var type: SegmentedGaugeTestingType = .default
    var title: SegmentedGaugeTitle = .default
    var description: SegmentedGaugeDescription = .default

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.alignment)" + "Alignment",
            self.withMarker ? "withMarker" : nil,
            "\(self.segments)" + "Segments",
            "\(self.size)" + "Size",
            "\(self.type)" + "Type",
            "\(self.title)" + "Title",
            "\(self.description)" + "Description"
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "segmented_gauge_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum SegmentedGaugeTitle: String, CaseIterable {
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
        case .withoutText: ""
        case .text: "title"
        case .other: "label"
        }
    }
}

enum SegmentedGaugeDescription: String, CaseIterable {
    case text
    case other

    static var `default` = Self.text

    var text: String? {
        switch self {
        case .text: "The description"
        case .other: nil
        }
    }

    var documentationName: String {
        switch self {
        case .text: "description"
        case .other: "label"
        }
    }
}
