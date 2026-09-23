//
//  SparkRadioButtonSnapshotTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 11/09/2025.
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

final class SparkRadioButtonSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let forDocumentation = false

        let scenarios = RadioButtonScenarioSnapshotTests.allCases(forDocumentation: forDocumentation)

        for scenario in scenarios {
            let configurations: [RadioButtonConfigurationSnapshotTests] = try scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .sparkRadioButtonIntent(configuration.intent)
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

    @ViewBuilder func component(configuration: RadioButtonConfigurationSnapshotTests) -> some View {
        if let text = configuration.content.text {
            SparkRadioButton(
                text,
                isSelected: .constant(configuration.value.isSelected)
            )
        } else if configuration.content == .other {
            SparkRadioButton(
                isSelected: .constant(configuration.value.isSelected),
                label: { OtherContentView() }
            )
        } else {
            SparkRadioButton(
                isSelected: .constant(configuration.value.isSelected)
            )
        }
    }
}
