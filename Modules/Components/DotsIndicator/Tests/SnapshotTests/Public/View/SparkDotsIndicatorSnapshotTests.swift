//
//  SparkDotsIndicatorSnapshotTests.swift
//  SparkComponentDotsIndicatorSnapshotTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentDotsIndicator
import SparkTheming
import SparkTheme

@MainActor
@Suite(.sparkConfiguration)
struct SparkDotsIndicatorSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test("Spark dots indicator snapshot", arguments: DotsIndicatorScenarioSnapshotTests.allCases)
    func test(scenario: DotsIndicatorScenarioSnapshotTests) async {
        for configuration in scenario.configuration() {
            let view = SparkDotsIndicator(
                numberOfPages: configuration.numberOfPages,
                currentPage: configuration.currentPage
            )
                .sparkDotsIndicatorSize(configuration.size)
                .sparkDotsIndicatorIntent(configuration.intent)
                .disabled(!configuration.isEnabled)
                .sparkTheme(self.theme)
                .padding(8)
                .background(configuration.intent.backgroundMocked)
                .fixedSize()
                .background(.background)
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

// MARK: - Extension

private extension DotsIndicatorIntent {

    /// The surface intent must be displayed on a dark background.
    var backgroundMocked: Color {
        return switch self {
        case .support: .clear
        case .surface: .black
        }
    }
}
