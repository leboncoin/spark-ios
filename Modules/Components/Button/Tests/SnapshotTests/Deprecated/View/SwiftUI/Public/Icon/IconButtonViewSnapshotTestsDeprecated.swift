//
//  IconButtonViewSnapshotTestsDeprecated.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// MARK: - Deprecated

/// This file is deprecated and should not be used for new tests.

import Testing
import SnapshotTesting
@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import SwiftUI

@Suite(.sparkConfiguration)
struct IconButtonViewSnapshotTestsDeprecated: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test func test() async throws {
        let scenarios = IconButtonScenarioSnapshotTestsDeprecated.allCases

        for scenario in scenarios {
            let configurations: [IconButtonConfigurationSnapshotTestsDeprecated] = try scenario.configuration(
                isSwiftUIComponent: true
            )

            for configuration in configurations {

                let view = self.component(configuration: configuration)
                    .disabled(configuration.state == .disabled)
                    .selected(configuration.state == .selected)
                    .image(configuration.image.rightValue, for: configuration.state)
                    .fixedSize()

                await self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }

    private func component(configuration: IconButtonConfigurationSnapshotTestsDeprecated) -> IconButtonView {
        return if let appearance = configuration.appearance {
            .init(
                theme: self.theme,
                appearance: appearance,
                size: configuration.size,
                shape: configuration.shape,
                action: {}
            )
        } else {
            .init(
                theme: self.theme,
                intent: configuration.intent,
                variant: configuration.variant,
                size: configuration.size,
                shape: configuration.shape,
                action: {}
            )
        }
    }
}
