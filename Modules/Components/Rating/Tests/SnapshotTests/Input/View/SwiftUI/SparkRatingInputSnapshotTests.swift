//
//  SparkRatingInputSnapshotTests.swift
//  SparkComponentRatingInputTests
//
//  Created by robin.lemaire on 12/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import SparkTheming
import SparkTheme
import SwiftUI

final class SparkRatingInputSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = RatingInputScenarioSnapshotTests.allCases

        for scenario in scenarios {
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
