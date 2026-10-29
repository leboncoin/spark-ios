//
//  SparkCheckboxGroupSnapshotTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 11/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SnapshotTesting
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import SwiftUI

@MainActor
@Suite(.sparkConfiguration)
struct SparkCheckboxGroupSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test("Spark checkbox group snapshot", arguments: CommonGroupScenarioSnapshotTests.allCases(forDocumentation: false))
    func test(scenario: CommonGroupScenarioSnapshotTests) async throws {
        let forDocumentation = false

        let configurations: [CommonGroupConfigurationSnapshotTests] = try scenario.configuration()

        for configuration in configurations {
            let view = SparkCheckboxGroup(
                selectedIDs: .constant([1]),
                items: .allCases(contentResilience: configuration.content)
            )
                .sparkTheme(self.theme)
                .sparkCheckboxGroupAxis(configuration.axis)
                .sparkCheckboxIntent(configuration.intent)
                .disabled(!configuration.status.isEnabled)
                .style(
                    forDocumentation: forDocumentation,
                    useLargePadding: true
                )

            await self.assertSnapshot(
                matching: view,
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName(),
                addPadding: false
            )
        }
    }
}
