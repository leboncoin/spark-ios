//
//  InputOTPSlotSnapshotTests.swift
//  SparkComponentInputOTPSnapshotTests
//
//  Created by robin.lemaire on 04/06/2026.
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

final class InputOTPSlotSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = InputOTPSlotScenarioSnapshotTests.allCases
        self.loadScenarios(scenarios)
    }

    // MARK: - Scenarios

    private func loadScenarios(_ scenarios: [InputOTPSlotScenarioSnapshotTests]) {
        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let typographies = InputOTPTypographies(
                    contentFontToken: self.theme.typography.display3
                )

                let view = InputOTPSlot(
                    value: configuration.content.valueMocked.isEmpty ? nil : configuration.content.valueMocked,
                    onError: false,
                    isFocus: configuration.isFocus,
                    typographies: typographies
                )
                .sparkTheme(self.theme)
                .padding(20)
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
