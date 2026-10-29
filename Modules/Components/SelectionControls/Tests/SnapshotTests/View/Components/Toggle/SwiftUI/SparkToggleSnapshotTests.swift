//
//  SparkToggleSnapshotTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 11/07/2025.
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
struct SparkToggleSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test(arguments: ToggleScenarioSnapshotTests.allCases(forDocumentation: false))
    func test(scenario: ToggleScenarioSnapshotTests) async throws {
        let forDocumentation = false

        let configurations: [ToggleConfigurationSnapshotTests] = try scenario.configuration()

        for configuration in configurations {
            let view = self.component(configuration: configuration)
                .sparkTheme(self.theme)
                .disabled(!configuration.status.isEnabled)
                .style(forDocumentation: forDocumentation)

            await self.assertSnapshot(
                matching: view,
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName(),
                addPadding: false
            )
        }
    }

    @ViewBuilder func component(configuration: ToggleConfigurationSnapshotTests) -> some View {
        if let text = configuration.content.text {
            SparkToggle(
                text,
                isOn: .constant(configuration.value.isOn)
            )
        } else if configuration.content == .other {
            SparkToggle(
                isOn: .constant(configuration.value.isOn),
                label: { OtherContentView() }
            )
        } else {
            SparkToggle(
                isOn: .constant(configuration.value.isOn)
            )
        }
    }
}
