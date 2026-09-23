//
//  TextFieldUIViewSnapshotTests.swift
//  SparkTextFieldSnapshotTests
//
//  Created by robin.lemaire on 05/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
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

final class TextFieldUIViewSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Type Alias

    private typealias Constants = TextFieldSnapshotConstants

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = TextFieldScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations: [TextFieldConfigurationSnapshotTests] = try scenario.configuration(
                isSwiftUIComponent: false
            )
            for configuration in configurations {

                let component: UIView
                let textField: UITextField

                if configuration.isAddons {
                    let addonsTextField: TextFieldAddonsUIView = .init(
                        theme: self.theme,
                        intent: configuration.intent
                    )
                    addonsTextField.textField.placeholder = configuration.placeholder.text
                    addonsTextField.textField.text = configuration.content.text

                    addonsTextField.textField.leftViewMode = configuration.leftContent.isNone ? .never : .always
                    addonsTextField.textField.rightViewMode = configuration.rightContent.isNone ? .never : .always
                    addonsTextField.textField.leftView = .sideView(for: configuration.leftContent)
                    addonsTextField.textField.rightView = .sideView(for: configuration.rightContent)

                    addonsTextField.setLeftAddon(
                        .sideView(for: configuration.leftAddonContent),
                        withPadding: configuration.isAddonsPadding
                    )
                    addonsTextField.setRightAddon(
                        .sideView(for: configuration.rightAddonContent),
                        withPadding: configuration.isAddonsPadding
                    )

                    addonsTextField.isEnabled = configuration.state.isEnabled
                    addonsTextField.isReadOnly = configuration.state == .readOnly

                    component = addonsTextField
                    textField = addonsTextField.textField

                } else {
                    let simpleTextField: TextFieldUIView = .init(
                        theme: self.theme,
                        intent: configuration.intent
                    )
                    simpleTextField.placeholder = configuration.placeholder.text
                    simpleTextField.text = configuration.content.text

                    simpleTextField.leftViewMode = configuration.leftContent.isNone ? .never : .always
                    simpleTextField.rightViewMode = configuration.rightContent.isNone ? .never : .always
                    simpleTextField.leftView = .sideView(for: configuration.leftContent)
                    simpleTextField.rightView = .sideView(for: configuration.rightContent)

                    simpleTextField.isEnabled = configuration.state.isEnabled
                    simpleTextField.isReadOnly = configuration.state == .readOnly

                    component = simpleTextField
                    textField = simpleTextField
                }
                component.translatesAutoresizingMaskIntoConstraints = false

                textField.isSecureTextEntry = configuration.isSecureEntry

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    backgroundView.widthAnchor.constraint(equalToConstant: Constants.width)
                ])
                backgroundView.addSubview(component)
                NSLayoutConstraint.stickEdges(
                    from: component,
                    to: backgroundView,
                    insets: .init(all: Constants.padding)
                )

                if configuration.isFocused {
                    _ = textField.becomeFirstResponder()
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

// MARK: - Extension

private extension UIView {

    static func sideView(for sideType: TextFieldSideViewType) -> UIView? {
        return switch sideType {
        case .empty: nil
        case .button: self.createButton()
        case .image: self.createImage()
        }
    }

    static func createButton() -> UIButton? {
        let button = UIButton(configuration: .filled())
        button.setTitle("Btn", for: .normal)
        return button
    }

    static func createImage() -> UIImageView? {
        let imageView = UIImageView(image: .init(systemName: "eject.circle.fill"))
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
}
