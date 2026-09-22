//
//  SliderConfigurationSnapshotTests.swift
//  SparkComponentSliderSnapshotTests
//
//  Created by robin.lemaire on 27/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct SliderConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: SliderScenarioSnapshotTests

    var intent: SliderIntent = .default
    var content: SliderContent = .default
    var contentType: SliderContentType = .default
    var isFloatingValue: Bool = false
    var step: Bool = false

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.intent)" + "Intent",
            "\(self.contentType)" + "ContentType",
            "\(self.content)" + "Content",
            self.isFloatingValue ? "IsFloatingValue" : nil,
            self.step ? "withStep" : nil
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "slider_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}

// MARK: - Enum

enum SliderContent: String, CaseIterable {
    case none
    case title
    case value
    case rangeValues
    case titleAndValue
    case titleAndRangeValues
    case valueAndRangeValues
    case allValues

    static var `default` = Self.none

    var documentationName: String? {
        switch self {
        case .none: nil
        case .title: "title"
        case .value: "value"
        case .rangeValues: "range_values"
        case .titleAndValue: "title_and_value"
        case .titleAndRangeValues: "title_and_range_values"
        case .valueAndRangeValues: "value_and_range_values"
        case .allValues: "all_values"
        }
    }
}

enum SliderContentType: String, CaseIterable {
    case text
    case custom

    static var `default` = Self.text
}
