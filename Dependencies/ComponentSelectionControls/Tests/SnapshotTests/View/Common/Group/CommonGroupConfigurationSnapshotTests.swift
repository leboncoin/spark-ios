//
//  CommonGroupConfigurationSnapshotTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 11/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
import XCTest

struct CommonGroupConfigurationSnapshotTests {

    // MARK: - Type Alias

    private typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    let scenario: CommonGroupScenarioSnapshotTests

    let status: CommonStatus
    let content: CommonGroupContentResilience
    let intent: CheckboxIntent
    let axis: CheckboxGroupAxis

    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Initialization

    init(
        scenario: CommonGroupScenarioSnapshotTests,
        status: CommonStatus,
        content: CommonGroupContentResilience,
        axis: CheckboxGroupAxis,
        intent: CheckboxIntent,
        modes: [ComponentSnapshotTestMode] = Constants.Modes.default,
        sizes: [UIContentSizeCategory] = Constants.Sizes.default
    ) {
        self.scenario = scenario
        self.status = status
        self.content = content
        self.axis = axis
        self.intent = intent
        self.modes = modes
        self.sizes = sizes
    }

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.status)" + "Status",
            "\(self.content)" + "Content",
            "\(self.axis)" + "Axis",
            "\(self.intent)" + "Intent"
        ].joined(separator: "-")
    }
}
