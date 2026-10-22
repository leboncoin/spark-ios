//
//  SparkCheckboxSnapshotTests.swift
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
struct SparkCheckboxSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test func test() throws {
        let forDocumentation = false

        let scenarios = CheckboxScenarioSnapshotTests.allCases(forDocumentation: forDocumentation)

        for scenario in scenarios {
            let configurations: [CheckboxConfigurationSnapshotTests] = try scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .sparkCheckboxIntent(configuration.intent)
                    .disabled(!configuration.status.isEnabled)
                    .style(forDocumentation: forDocumentation)

                self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName(),
                    addPadding: false
                )
            }
        }
    }

    @ViewBuilder func component(configuration: CheckboxConfigurationSnapshotTests) -> some View {
        if let text = configuration.content.text {
            SparkCheckbox(
                text,
                selectionState: .constant(configuration.value.selectionState)
            )
        } else if configuration.content == .other {
            SparkCheckbox(
                selectionState: .constant(configuration.value.selectionState),
                label: { OtherContentView() }
            )
        } else {
            SparkCheckbox(
                selectionState: .constant(configuration.value.selectionState)
            )
        }
    }
}
