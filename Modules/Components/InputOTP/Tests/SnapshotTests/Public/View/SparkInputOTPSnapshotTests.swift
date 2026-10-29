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

    @Test func test() async {
        let scenarios = InputOTPScenarioSnapshotTests.allCases
        await self.loadScenarios(scenarios)
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
                    .padding(.vertical, 22)
                    .padding(.horizontal, configuration.digits.horizontalPadding)
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

// MARK: - Extension

private extension InputOTPDigits {

    var horizontalPadding: CGFloat {
        switch self {
        case .four:
            25
        case .six:
            60
        case .eight:
            80
        }
    }
}

