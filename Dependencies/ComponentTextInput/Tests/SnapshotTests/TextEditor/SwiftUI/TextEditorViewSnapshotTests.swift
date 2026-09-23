//
//  TextEditorViewSnapshotTests.swift
//  SparkTextEditorSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import SwiftUI

final class TextEditorViewSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Type Alias

    private typealias Constants = TextEditorSnapshotConstants

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
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
                    testName: configuration.testName()
                )
            }
        }
    }
}

// MARK: - Extension

private extension View {

//    @ViewBuilder
//    func height(_ configuration: TextEditorConfigurationSnapshotTests) -> some View {
//        if configuration.height.isFixed {
//            self.frame(height: configuration.height.value)
//        } else {
//            
//        }
//    }

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

