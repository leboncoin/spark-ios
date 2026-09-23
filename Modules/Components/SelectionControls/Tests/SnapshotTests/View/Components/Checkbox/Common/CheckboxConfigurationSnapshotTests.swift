//
//  CheckboxConfigurationSnapshotTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 11/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
import XCTest

struct CheckboxConfigurationSnapshotTests {

    // MARK: - Type Alias

    private typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    let scenario: CheckboxScenarioSnapshotTests

    let value: CheckboxValue
    let status: CommonStatus
    let content: CommonContentResilience
    let intent: CheckboxIntent

    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Initialization

    init(
        scenario: CheckboxScenarioSnapshotTests,
        value: CheckboxValue,
        status: CommonStatus,
        content: CommonContentResilience,
        intent: CheckboxIntent,
        modes: [ComponentSnapshotTestMode] = Constants.Modes.default,
        sizes: [UIContentSizeCategory] = Constants.Sizes.default
    ) {
        self.scenario = scenario
        self.value = value
        self.status = status
        self.content = content
        self.intent = intent
        self.modes = modes
        self.sizes = sizes
    }

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.value)" + "Value",
            "\(self.status)" + "Status",
            "\(self.content)" + "Content",
            "\(self.intent)" + "Intent"
        ].joined(separator: "-")
    }
}

// MARK: - Enum

enum CheckboxValue: String, CaseIterable {
    case selected
    case unselected
    case indeterminate

    var selectionState: CheckboxSelectionState {
        switch self {
        case .selected: .selected
        case .unselected: .unselected
        case .indeterminate: .indeterminate
        }
    }
}
