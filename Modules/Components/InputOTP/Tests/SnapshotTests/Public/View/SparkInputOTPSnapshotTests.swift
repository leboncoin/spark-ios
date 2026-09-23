//
//  SparkInputOTPSnapshotTests.swift
//  SparkComponentInputOTPSnapshotTests
//
//  Created by robin.lemaire on 03/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentInputOTP
import SparkTheming
import SparkTheme

final class SparkInputOTPSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = InputOTPScenarioSnapshotTests.allCases
        self.loadScenarios(scenarios)
    }

    // MARK: - Scenarios

    private func loadScenarios(_ scenarios: [InputOTPScenarioSnapshotTests]) {
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

                self.assertSnapshot(
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

