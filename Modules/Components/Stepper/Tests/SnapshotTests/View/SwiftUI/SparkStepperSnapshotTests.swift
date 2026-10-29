//
//  SparkStepperSnapshotTests.swift
//  SparkComponentStepperSnapshotTests
//
//  Created by robin.lemaire on 05/03/2025.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SnapshotTesting
@testable import SparkComponentStepper
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import SwiftUI

@MainActor
@Suite(.sparkConfiguration)
struct SparkStepperSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test func test() async throws {
        let scenarios = StepperScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = try scenario.configuration()

            for configuration in configurations {
                let view = self.createComponent(for: configuration)
                    .sparkTheme(self.theme)
                    .disabled(configuration.state == .disabled)
                    .frame(width: configuration.width)
                    .padding(1)
                    .background(.background)

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

    // MARK: - ViewBuild

    @ViewBuilder
    func createComponent(for configuration: StepperConfigurationSnapshotTests) -> some View {
        let locale = Locale(identifier: "fr_FR")
        switch configuration.contentResilience {
        case .currency:
            SparkStepper(
                value: .constant(configuration.state.value(from: configuration.range)),
                in: configuration.range,
                format: .currency(code: "EUR").locale(locale)
            )

        case .percentage:
            SparkStepper(
                value: .constant(configuration.state.value(from: configuration.range)),
                in: configuration.range,
                format: .percent.locale(locale)
            )

        case .numberOnly:
            SparkStepper(
                value: .constant(Int(configuration.state.value(from: configuration.range))),
                in: Int(configuration.range.lowerBound)...Int(configuration.range.upperBound)
            )
        }
    }
}
