//
//  SparkToggleSnapshotTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 11/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import SwiftUI

final class SparkToggleSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let forDocumentation = false

        let scenarios = ToggleScenarioSnapshotTests.allCases(forDocumentation: forDocumentation)

        for scenario in scenarios {
            let configurations: [ToggleConfigurationSnapshotTests] = try scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .disabled(!configuration.status.isEnabled)
                    .style(forDocumentation: forDocumentation)

                self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
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
