//
//  ToggleConfigurationSnapshotTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 11/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
import XCTest

struct ToggleConfigurationSnapshotTests {

    // MARK: - Type Alias

    private typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    let scenario: ToggleScenarioSnapshotTests

    let value: ToggleValue
    let status: CommonStatus
    let content: CommonContentResilience

    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Initialization

    init(
        scenario: ToggleScenarioSnapshotTests,
        value: ToggleValue,
        status: CommonStatus,
        content: CommonContentResilience,
        modes: [ComponentSnapshotTestMode] = Constants.Modes.default,
        sizes: [UIContentSizeCategory] = Constants.Sizes.default
    ) {
        self.scenario = scenario
        self.value = value
        self.status = status
        self.content = content
        self.modes = modes
        self.sizes = sizes
    }

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.value)" + "Value",
            "\(self.status)" + "Status",
            "\(self.content)" + "Content"
        ].joined(separator: "-")
    }
}

// MARK: - Enum

enum ToggleValue: String, CaseIterable {
    case activated
    case deactivated

    var isOn: Bool {
        switch self {
        case .activated: true
        case .deactivated: false
        }
    }
}
