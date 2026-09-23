//
//  IconConfigurationSnapshotTests.swift
//  SparkComponentIconSnapshotTests
//
//  Created by robin.lemaire on 02/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentIcon
@_spi(SI_SPI) import SparkComponentIconTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct IconConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: IconScenarioSnapshotTests

    var intent: IconTestingIntent = .default
    var size: IconTestingSize = .default

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.intent)" + "Intent",
            "\(self.size)" + "Size"
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "icon_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}
