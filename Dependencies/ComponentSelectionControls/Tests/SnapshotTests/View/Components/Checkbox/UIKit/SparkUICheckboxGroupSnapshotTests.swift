//
//  SparkUICheckboxGroupSnapshotTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 11/09/2025.
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

final class SparkUICheckboxGroupSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Type Alias

    private typealias Constants = CommonSnapshotConstants

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = CommonGroupScenarioSnapshotTests.allCases()

        for scenario in scenarios {
            let configurations: [CommonGroupConfigurationSnapshotTests] = try scenario.configuration()
            for configuration in configurations {
                let view = SparkUICheckboxGroup<Int>(
                    theme: self.theme
                )
                view.axis = configuration.axis
                view.intent = configuration.intent
                view.items = .allCases(contentResilience: configuration.content)
                view.selectedIDs = [1]
                view.isEnabled = configuration.status.isEnabled
                view.addBackgroundColor()

                let backgroundView = view.createBackgroundView(useMaxWidth: false)

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
