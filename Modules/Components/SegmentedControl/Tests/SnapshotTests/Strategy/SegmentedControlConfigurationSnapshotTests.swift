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
    var rowLength: SegmentedControlRowLength = .default
    var selectedIndex: Int = 1
    var disabledIndexes: [Int] = []

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
            self.rowLength != .default ? "\(self.rowLength)" + "RowLength" : nil,
            self.selectedIndex >= 0 ? "selectedIndex\(self.selectedIndex)" : "noSelection",
            !self.disabledIndexes.isEmpty ? "disabledIndexes" + self.disabledIndexes.map { "\($0)" }.joined() : nil
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
