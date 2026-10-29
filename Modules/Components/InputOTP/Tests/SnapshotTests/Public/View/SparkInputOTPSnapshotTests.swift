//
//  SparkInputOTPSnapshotTests.swift
//  SparkComponentInputOTPSnapshotTests
//
//  Created by robin.lemaire on 03/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentInputOTP
import SparkTheming
import SparkTheme

@MainActor
@Suite(.sparkConfiguration)
struct SparkInputOTPSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test("Spark input OTPSnapshot", arguments: InputOTPScenarioSnapshotTests.allCases)
    func test(scenario: InputOTPScenarioSnapshotTests) async {
        await self.loadScenarios([scenario])
    }

    // MARK: - Scenarios

    private func loadScenarios(_ scenarios: [InputOTPScenarioSnapshotTests]) async {
        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = SparkInputOTP(value: .constant(configuration.value))
                    .sparkTheme(self.theme)
                    .sparkInputOTPDigits(configuration.digits)
                    .sparkInputOTPOnError(configuration.onError)
                    .disabled(!configuration.isEnabled)
                    .background(.background)
                    .fixedSize()
                    .sparkIsSnapshot(true)

                await self.assertSnapshot(
                    matching: view,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName,
                    forDocumentation: scenario.isDocumentation
                )
            }
        }
    }
}
