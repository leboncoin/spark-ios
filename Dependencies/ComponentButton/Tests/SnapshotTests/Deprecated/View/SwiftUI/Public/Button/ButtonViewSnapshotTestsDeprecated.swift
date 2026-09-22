//
//  ButtonViewSnapshotTestsDeprecated.swift
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
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import SwiftUI

final class ButtonViewSnapshotTestsDeprecated: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = ButtonScenarioSnapshotTestsDeprecated.allCases

        for scenario in scenarios {
            let configurations: [ButtonConfigurationSnapshotTestsDeprecated] = try scenario.configuration(
                isSwiftUIComponent: true
            )

            for configuration in configurations {

                let view = self.component(configuration: configuration)
                    .disabled(configuration.state == .disabled)
                    .selected(configuration.state == .selected)
                    .content(configuration)
                    .fixedSize()

                self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }

    private func component(configuration: ButtonConfigurationSnapshotTestsDeprecated) -> ButtonView {
        return if let appearance = configuration.appearance {
            .init(
                theme: self.theme,
                appearance: appearance,
                size: configuration.size,
                shape: configuration.shape,
                alignment: configuration.alignment,
                action: {}
            )
        } else {
            .init(
                theme: self.theme,
                intent: configuration.intent,
                variant: configuration.variant,
                size: configuration.size,
                shape: configuration.shape,
                alignment: configuration.alignment,
                action: {}
            )
        }
    }
}

// MARK: - Extension

private extension ButtonView {

    @ViewBuilder
    func content(_ configuration: ButtonConfigurationSnapshotTestsDeprecated) -> some View {
        let state = configuration.state
        switch configuration.content {
        case .title(let title):
            self.title(title, for: state)

        case .attributedTitle(let attributedTitle):
            self.attributedTitle(attributedTitle.rightValue, for: state)

        case .titleAndImage(let title, let image):
            self.title(title, for: state)
                .image(image.rightValue, for: state)

        case .attributedTitleAndImage(let attributedTitle, let image):
            self.attributedTitle(attributedTitle.rightValue, for: state)
                .image(image.rightValue, for: state)
        }
    }
}
