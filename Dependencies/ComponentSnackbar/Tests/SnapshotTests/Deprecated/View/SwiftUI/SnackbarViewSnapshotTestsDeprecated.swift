//
//  SnackbarViewSnapshotTestsDeprecated.swift
//  SparkComponentSnackbarTests
//
//  Created by louis.borlee on 01/10/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SparkComponentButton
@testable import SparkTheme
@testable import SparkTheming
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonTesting
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

@testable import SparkComponentSnackbar

@available(*, deprecated, message: "This test is deprecated and will be removed in a future version.")
final class SnackbarViewSnapshotTestsDeprecated: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test1() {
        self._test(.test1)
    }

    func test2() {
        self._test(.test2)
    }

    func test3() {
        self._test(.test3)
    }

    private func _test(_ scenario: SnackbarScenarioDeprecated) {
        for configuration in scenario.configurations {
            self.assertSnapshot(
                matching:
                    self.snackbar(configuration: configuration)
                    .frame(width: 300)
                    .lineLimit(configuration.isTextMultiline ? nil : 0)
                    .padding(.all, 12)
                    .background(self.theme.colors.base.background.color)
                    .fixedSize(),
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName
            )
        }
    }

    @ViewBuilder
    private func snackbar(configuration: SnackbarScenarioConfigurationDeprecated) -> some View {
        switch configuration.buttonConfiguration {
        case .none:
            SnackbarView(
                theme: self.theme,
                intent: configuration.intent,
                image: configuration.withImage ? Image(systemName: "checkmark.circle.fill") : nil,
                text: {
                    self.text(configuration: configuration)
                }
            )
            .type(configuration.type)
            .variant(configuration.variant)
        case .shortText(let text), .longText(let text):
            SnackbarView(
                theme: self.theme,
                intent: configuration.intent,
                image: configuration.withImage ? Image(systemName: "checkmark.circle.fill") : nil,
                text: {
                    self.text(configuration: configuration)
                }) { configuration in
                    ButtonView(
                        theme: self.theme,
                        intent: configuration.intent,
                        variant: configuration.variant,
                        size: configuration.size,
                        shape: configuration.shape,
                        alignment: .leadingImage,
                        action: {}
                    )
                    .title(text, for: .normal)
                }
                .type(configuration.type)
                .variant(configuration.variant)
        }
    }

    @ViewBuilder
    private func text(configuration: SnackbarScenarioConfigurationDeprecated) -> Text {
        Text(configuration.textConfiguration.text)
    }
}
