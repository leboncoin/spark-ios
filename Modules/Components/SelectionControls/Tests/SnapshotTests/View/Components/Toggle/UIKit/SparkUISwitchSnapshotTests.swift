//
//  SparkUISwitchSnapshotTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 11/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import UIKit
import SnapshotTesting
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

@MainActor
@Suite(.sparkConfiguration)
struct SparkUISwitchSnapshotTests: UIKitComponentSnapshotTesting {

    // MARK: - Type Alias

    private typealias Constants = CommonSnapshotConstants

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test(arguments: ToggleScenarioSnapshotTests.allCases())
    func test(scenario: ToggleScenarioSnapshotTests) async throws {
        let configurations: [ToggleConfigurationSnapshotTests] = try scenario.configuration()
        for configuration in configurations {
            let view = SparkUISwitch(
                theme: self.theme
            )
            view.isOn = configuration.value.isOn
            view.isEnabled = configuration.status.isEnabled

            if let text = configuration.content.text {
                view.text = text
            } else if configuration.content == .other {
                view.attributedText = .snapshot()
            }
            view.addBackgroundColor()

            let backgroundView = view.createBackgroundView()

            await self.assertSnapshot(
                matching: backgroundView,
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName()
            )
        }
    }
}
