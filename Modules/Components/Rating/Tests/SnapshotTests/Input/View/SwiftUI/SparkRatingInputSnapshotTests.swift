//
//  SparkRatingInputSnapshotTests.swift
//  SparkComponentRatingInputTests
//
//  Created by robin.lemaire on 12/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SnapshotTesting
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import SparkTheming
import SparkTheme
import SwiftUI

@MainActor
@Suite(.sparkConfiguration)
struct SparkRatingInputSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test("Spark rating input snapshot", arguments: RatingInputScenarioSnapshotTests.allCases)
    func test(scenario: RatingInputScenarioSnapshotTests) async throws {
        let configurations = scenario.configuration()

        for configuration in configurations {
            let view = SparkRatingInput(
                value: .constant(configuration.value.rawValue)
            )
                .sparkTheme(self.theme)
                .disabled(configuration.isDisabled)
                .padding(.horizontal, 20)
                .padding(.vertical, 4)
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
