//
//  SparkBadgeSnapshotTests.swift
//  SparkComponentBadgeSnapshotTests
//
//  Created by robin.lemaire on 24/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentBadge
import SparkTheming
import SparkTheme

final class SparkBadgeSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = BadgeScenarioSnapshotTests.allCases
        self.loadScenarios(scenarios)
    }

    // MARK: - Scenarios

    private func loadScenarios(_ scenarios: [BadgeScenarioSnapshotTests]) {
        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.rectangle(configuration: configuration) {
                    self.components(configuration: configuration)
                        .sparkBadgeIntent(configuration.intent)
                        .sparkBadgeSize(configuration.size)
                        .sparkBadgeIsBorder(configuration.isBorder)
                }
                    .sparkTheme(self.theme)
                    .padding(configuration.size.padding(
                        forDocumentation: scenario.isDocumentation
                    ))
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

    // MARK: - View Builder

    @ViewBuilder
    private func components(configuration: BadgeConfigurationSnapshotTests) -> some View {
        if let value = configuration.content.value {
            SparkBadge(
                value: value,
                unit: configuration.content.unit
            )
        } else {
            SparkBadge()
        }
    }

    @ViewBuilder
    private func rectangle<Badge>(
        configuration: BadgeConfigurationSnapshotTests,
        @ViewBuilder badge: @escaping () -> Badge
    ) -> some View where Badge: View {
        if let attachPosition = configuration.attachPosition {

            Rectangle()
                .fill(.blue)
                .frame(size: 40)
                .attachSparkBadge(position: attachPosition) {
                    badge()
                }

        } else {
            badge()
        }
    }
}

// MARK: - Extension

private extension BadgeSize {

    func padding(forDocumentation: Bool) -> CGFloat {
        switch self {
        case .small:
            forDocumentation ? 30 : 25
        case .medium:
            forDocumentation ? 30 : 40
        }
    }
}
