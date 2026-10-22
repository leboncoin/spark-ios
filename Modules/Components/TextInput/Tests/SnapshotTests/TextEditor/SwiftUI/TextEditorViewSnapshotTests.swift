//
//  TextEditorViewSnapshotTests.swift
//  SparkTextEditorSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SnapshotTesting
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import SwiftUI

@MainActor
@Suite(.sparkConfiguration)
struct TextEditorViewSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Type Alias

    private typealias Constants = TextEditorSnapshotConstants

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test func test() throws {
        let scenarios = TextEditorScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations: [TextEditorConfigurationSnapshotTests] = try scenario.configuration(
                isSwiftUIComponent: true
            )

            for configuration in configurations {
                let view = SparkTextEditor(
                    configuration.placeholder.text ?? configuration.content.text,
                    text: .constant(configuration.content.text)
                )
                    .sparkTheme(self.theme)
                    .sparkTextEditorIntent(configuration.intent)
                    .sparkTextEditorReadOnly(configuration.state.isReadOnly)
                    .disabled(!configuration.state.isEnabled)
                    .frame(width: Constants.width)
                    .frame(height: configuration.height.value)
                    .style(forDocumentation: false)

                self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName(),
                    addPadding: false
                )
            }
        }
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func style(forDocumentation: Bool) -> some View {
        if forDocumentation {
            self.frame(height: 100)
                .padding(4)
        } else {
            self.padding(TextEditorSnapshotConstants.padding)
            .background(Color(uiColor: .secondarySystemBackground))
        }
    }
}

