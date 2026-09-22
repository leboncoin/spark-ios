//
//  SparkRatingDisplaySnapshotTests.swift
//  SparkComponentRatingDisplayTests
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

final class SparkRatingDisplaySnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = RatingDisplayScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {

                let view = self.component(configuration)
                    .sparkTheme(self.theme)
                    .sparkRatingDisplaySize(configuration.size)
                    .sparkRatingDisplayStars(configuration.stars)
                    .padding(.horizontal, self.horizontalPadding(configuration: configuration))
                    .padding(configuration)
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

    @ViewBuilder
    private func component(_ configuration: RatingDisplayConfigurationSnapshotTests) -> some View {

        // Configure content based on configuration
        let value = configuration.value.formattedValue
        let count = "50"
        let additional = "Excellent"

        switch (configuration.content, configuration.contentType) {

            // Without values

        case (.none, _):
            SparkRatingDisplay(value: configuration.value.rawValue)

            // Value only

        case (.value, .text):
            SparkRatingDisplay(
                value: configuration.value.rawValue,
                text: value
            )

        case (.value, .custom):
            SparkRatingDisplay(
                value: configuration.value.rawValue,
                label: {
                    OtherContentView(text: value)
                }
            )

            // Value & Count

        case (.valueAndCount, .text):
            SparkRatingDisplay(
                value: configuration.value.rawValue,
                valueText: value,
                countText: count
            )

        case (.valueAndCount, .custom):
            SparkRatingDisplay(
                value: configuration.value.rawValue,
                valueLabel: {
                    OtherContentView(text: value)
                },
                countLabel: {
                    OtherContentView(text: count)
                }
            )

            // Value & Additional

        case (.valueAndAdditional, .text):
            SparkRatingDisplay(
                value: configuration.value.rawValue,
                valueText: value,
                additionalText: additional
            )

        case (.valueAndAdditional, .custom):
            SparkRatingDisplay(
                value: configuration.value.rawValue,
                valueLabel: {
                    OtherContentView(text: value)
                },
                additionalLabel: {
                    OtherContentView(text: additional)
                }
            )

            // All Values

        case (.allValues, .text):
            SparkRatingDisplay(
                value: configuration.value.rawValue,
                valueText: value,
                countText: count,
                additionalText: additional
            )

        case (.allValues, .custom):
            SparkRatingDisplay(
                value: configuration.value.rawValue,
                valueLabel: {
                    OtherContentView(text: value)
                },
                countLabel: {
                    OtherContentView(text: count)
                },
                additionalLabel: {
                    OtherContentView(text: additional)
                }
            )
        }
    }

    // MARK: - Helpers

    private func horizontalPadding(configuration: RatingDisplayConfigurationSnapshotTests) -> CGFloat {
        return switch (configuration.stars, configuration.size) {
        case (.one, _): 4
        case (_, .small): 10
        case (_, .medium): 12
        case (_, .large): 12
        default: 0
        }
    }
}

// MARK: - Other View

private struct OtherContentView: View {
    let text: String
    var body: some View {
        Group {
            Text(self.text) +
            Text("!")
                .bold()
                .foregroundColor(.blue)
        }
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func padding(_ configuration: RatingDisplayConfigurationSnapshotTests) -> some View {
        let view = self.padding(.vertical, 4)

        switch (configuration.stars, configuration.content) {
        case (.five, .value), (.five, .valueAndCount): view.padding(.horizontal, 20)
        case (.five, .valueAndAdditional), (.five, .allValues): view.padding(.horizontal, 40)
        default: view
        }
    }
}
