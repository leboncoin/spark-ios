//
//  TextFieldAddonsComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias TextFieldAddonsComponentUIViewController = ComponentDisplayViewControllerRepresentable<TextFieldAddonsConfiguration, TextFieldAddonsUIView, TextFieldAddonsConfigurationView, TextFieldAddonsComponentUIViewMaker>

extension TextFieldAddonsComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class TextFieldAddonsComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = TextFieldAddonsConfiguration
    typealias ComponentView = TextFieldAddonsUIView
    typealias ConfigurationView = TextFieldAddonsConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, TextFieldAddonsComponentUIViewMaker>

    // MARK: - Static Properties

    static var fullWidth: Bool { true }

    // MARK: - Static Methods

    static func createComponentView(
        for configuration: Configuration,
        viewController: DisplayViewController?
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            intent: configuration.intent
        )
        self.updateCommonProperties(componentView, for: configuration)

        return componentView
    }

    static func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration,
        viewController: DisplayViewController?
    ) {
        componentView.textField.theme = configuration.theme.value
        componentView.textField.intent = configuration.intent
        self.updateCommonProperties(componentView, for: configuration)
    }

    private static func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.textField.placeholder = configuration.placeholder
        componentView.textField.isSecureTextEntry = configuration.isSecure

        componentView.textField.demoLeftView(configuration)
        componentView.textField.leftViewMode = configuration.uiKitLeftViewMode
        componentView.textField.demoRightView(configuration)
        componentView.textField.rightViewMode = configuration.uiKitRightViewMode

        componentView.demoLeftAddon(configuration)
        componentView.demoRightAddon(configuration)

        componentView.textField.rightViewMode = configuration.uiKitRightViewMode
        componentView.textField.clearButtonMode = configuration.uiKitClearButtonMode
        componentView.isUserInteractionEnabled = configuration.uiKitIsUserInteractionEnabled
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityValue(configuration)
        componentView.demoBackground(configuration)
    }
}

// MARK: - Extension

extension TextFieldAddonsUIView {

    func demoLeftAddon<Configuration: TextFieldAddonsConfiguration>(
        _ configuration: Configuration
    ) {
        let addon = TextFieldSideUIView.sideView(
            theme: configuration.theme,
            sideViewContent: configuration.leftAddonContentType,
            side: .left,
            isAddon: true
        )
        self.setLeftAddon(addon, withPadding: configuration.isLeftAddonPadding)
    }

    func demoRightAddon<Configuration: TextFieldAddonsConfiguration>(
        _ configuration: Configuration
    ) {
        let addon = TextFieldSideUIView.sideView(
            theme: configuration.theme,
            sideViewContent: configuration.rightAddonContentType,
            side: .right,
            isAddon: true
        )
        self.setRightAddon(addon, withPadding: configuration.isRightAddonPadding)
    }
}

