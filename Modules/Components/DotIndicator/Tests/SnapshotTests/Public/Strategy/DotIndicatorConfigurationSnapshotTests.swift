//
//  DotIndicatorConfigurationSnapshotTests.swift
//  SparkComponentDotIndicatorSnapshotTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentDotIndicator
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct DotIndicatorConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: DotIndicatorScenarioSnapshotTests

    var numberOfPages: Int = 5
    var currentPage: Int = 2
    var size: DotIndicatorSize = .default
    var intent: DotIndicatorIntent = .default
    var isEnabled: Bool = true

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        let parts: [String] = [
            "\(self.numberOfPages)" + "Pages",
            "page" + "\(self.currentPage)",
            "\(self.size)" + "Size",
            "\(self.intent)" + "Intent",
            !self.isEnabled ? "disabled" : nil
        ].compactMap { $0 }

        return parts.joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "dotIndicator_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}
