//
//  CircularMeterConfigurationSnapshotTests.swift
//  SparkComponentCircularMeterSnapshotTests
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentCircularMeter
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct CircularMeterConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: CircularMeterScenarioSnapshotTests

    var value: Double = 0.5
    var intent: CircularMeterIntent = .default
    var size: CircularMeterSize = .default
    var displayType: CircularMeterDisplayType = .default
    var labelsType: CircularMeterContentType = .default
    var isText: Bool = true
    var isContent: Bool = true

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.intent)" + "Intent",
            "\(self.value)" + "Value",
            "\(self.size)" + "Size",
            "\(self.displayType)" + "DisplayType",
            self.isText ? self.labelsType.name(for: "title") : nil,
            self.isContent ? self.labelsType.name(for: "content") : nil
        ]
            .compactMap { $0 }
            .joined(separator: "_")
    }

    var testName: String {
        return if let documentationName {
            "circularmeter_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}
