//
//  DotsIndicatorConfigurationSnapshotTests.swift
//  SparkComponentDotsIndicatorSnapshotTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentDotsIndicator
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct DotsIndicatorConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: DotsIndicatorScenarioSnapshotTests

    var numberOfPages: Int = 5
    var currentPage: Int = 2
    var size: DotsIndicatorSize = .default
    var intent: DotsIndicatorIntent = .default
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
            "dotsIndicator_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}
