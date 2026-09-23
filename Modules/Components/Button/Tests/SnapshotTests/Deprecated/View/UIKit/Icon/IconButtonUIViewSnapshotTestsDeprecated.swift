//
//  IconButtonUIViewSnapshotTestsDeprecated.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// MARK: - Deprecated

/// This file is deprecated and should not be used for new tests.

import XCTest
import SnapshotTesting
@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

final class IconButtonUIViewSnapshotTestsDeprecated: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = IconButtonScenarioSnapshotTestsDeprecated.allCases

        for scenario in scenarios {
            let configurations: [IconButtonConfigurationSnapshotTestsDeprecated] = try scenario.configuration(
                isSwiftUIComponent: false
            )
            for configuration in configurations {

                let view = self.component(configuration: configuration)
                view.isHighlighted = configuration.state == .highlighted
                view.isEnabled = configuration.state != .disabled
                view.isSelected = configuration.state == .selected

                view.setImage(configuration.image.leftValue, for: configuration.state)

                self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }

    private func component(configuration: IconButtonConfigurationSnapshotTestsDeprecated) -> IconButtonUIView {
        return if let appearance = configuration.appearance {
            .init(
                theme: self.theme,
                appearance: appearance,
                size: configuration.size,
                shape: configuration.shape
            )
        } else {
            .init(
                theme: self.theme,
                intent: configuration.intent,
                variant: configuration.variant,
                size: configuration.size,
                shape: configuration.shape
            )
        }
    }
}
