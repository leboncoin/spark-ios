//
//  ProgressBarConfigurationSnapshotTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 05/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import XCTest

struct ProgressBarConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: ProgressBarScenarioSnapshotTests

    var intent: ProgressBarIntent = .default
    var shape: ProgressBarShape = .default
    var value: CGFloat = 0.5
    let width: CGFloat = 100

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.scenario.rawValue)",
            "\(self.intent)",
            "\(self.shape)" + "Shape",
            "\(self.value)" + "Value"
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "progress_bar_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}
