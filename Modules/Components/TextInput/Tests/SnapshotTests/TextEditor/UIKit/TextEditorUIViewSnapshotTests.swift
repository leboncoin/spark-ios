//
//  TextEditorUIViewSnapshotTests.swift
//  SparkTextEditorSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

final class TextEditorUIViewSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Type Alias

    private typealias Constants = TextEditorSnapshotConstants

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = TextEditorScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations: [TextEditorConfigurationSnapshotTests] = try scenario.configuration(
                isSwiftUIComponent: false
            )
            for configuration in configurations {

                let textEditor: TextEditorUIView = .init(
                    theme: self.theme,
                    intent: configuration.intent
                )
                textEditor.placeholder = configuration.placeholder.text ?? configuration.content.text
                textEditor.text = configuration.content.text
                textEditor.isEnabled = configuration.state.isEnabled
                textEditor.isEditable = configuration.state.isEditable
                textEditor.isScrollEnabled = configuration.height.isScrollEnabled
                if let height = configuration.height.value {
                    NSLayoutConstraint.activate([
                        textEditor.heightAnchor.constraint(equalToConstant: height)
                    ])
                }

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    backgroundView.widthAnchor.constraint(equalToConstant: Constants.width)
                ])
                backgroundView.addSubview(textEditor)
                NSLayoutConstraint.stickEdges(
                    from: textEditor,
                    to: backgroundView,
                    insets: .init(all: Constants.padding)
                )

                if configuration.isFocused {
                    _ = textEditor.becomeFirstResponder()
                }

                self.assertSnapshot(
                    matching: backgroundView,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }
}
