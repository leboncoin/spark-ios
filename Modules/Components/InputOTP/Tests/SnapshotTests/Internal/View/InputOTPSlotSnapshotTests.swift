//
//  InputOTPSlotSnapshotTests.swift
//  SparkComponentInputOTPSnapshotTests
//
//  Created by robin.lemaire on 04/06/2026.
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
struct InputOTPSlotSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test(arguments: InputOTPSlotScenarioSnapshotTests.allCases)
    func test(scenario: InputOTPSlotScenarioSnapshotTests) async {
        await self.loadScenarios([scenario])
    }

    // MARK: - Scenarios

    private func loadScenarios(_ scenarios: [InputOTPSlotScenarioSnapshotTests]) async {
        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = InputOTPSlot(
                    value: configuration.content.valueMocked.isEmpty ? nil : configuration.content.valueMocked,
                    onError: false,
                    isFocus: configuration.isFocus
                )
                .sparkTheme(self.theme)
                .padding(20)
                .background(.background)
                .fixedSize()

                await self.assertSnapshot(
                    matching: view,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName,
                    addPadding: false,
                    forDocumentation: scenario.isDocumentation
                )
            }
        }
    }
}
