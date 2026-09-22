//
//  SparkUISwitchSnapshotTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 11/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

final class SparkUISwitchSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Type Alias

    private typealias Constants = CommonSnapshotConstants

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = ToggleScenarioSnapshotTests.allCases()

        for scenario in scenarios {
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

                self.assertSnapshot(
                    matching: backgroundView,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }
}
