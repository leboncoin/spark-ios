//
//  ButtonUIViewSnapshotTestsDeprecated.swift
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
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

final class ButtonUIViewSnapshotTestsDeprecated: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = ButtonScenarioSnapshotTestsDeprecated.allCases

        for scenario in scenarios {
            let configurations: [ButtonConfigurationSnapshotTestsDeprecated] = try scenario.configuration(
                isSwiftUIComponent: false
            )
            for configuration in configurations {

                let view = self.component(configuration: configuration)
                view.isHighlighted = configuration.state == .highlighted
                view.isEnabled = configuration.state != .disabled
                view.isSelected = configuration.state == .selected

                let state = configuration.state
                switch configuration.content {
                case .title(let title):
                    view.setTitle(title, for: state)

                case .attributedTitle(let attributedTitle):
                    view.setAttributedTitle(attributedTitle.leftValue, for: state)

                case .titleAndImage(let title, let image):
                    view.setTitle(title, for: state)
                    view.setImage(image.leftValue, for: state)

                case .attributedTitleAndImage(let attributedTitle, let image):
                    view.setAttributedTitle(attributedTitle.leftValue, for: state)
                    view.setImage(image.leftValue, for: state)
                }

                self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }

    private func component(configuration: ButtonConfigurationSnapshotTestsDeprecated) -> ButtonUIView {
        return if let appearance = configuration.appearance {
            .init(
                theme: self.theme,
                appearance: appearance,
                size: configuration.size,
                shape: configuration.shape,
                alignment: configuration.alignment
            )
        } else {
            .init(
                theme: self.theme,
                intent: configuration.intent,
                variant: configuration.variant,
                size: configuration.size,
                shape: configuration.shape,
                alignment: configuration.alignment
            )
        }
    }
}
