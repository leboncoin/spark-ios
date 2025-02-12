//
//  TextFieldComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias TextFieldComponentUIViewController = ComponentDisplayViewControllerRepresentable<TextFieldConfiguration, TextFieldUIView, TextFieldConfigurationView, TextFieldComponentUIViewMaker>

extension TextFieldComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class TextFieldComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = TextFieldConfiguration
    typealias ComponentView = TextFieldUIView
    typealias ConfigurationView = TextFieldConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, TextFieldComponentUIViewMaker>

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
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent
        self.updateCommonProperties(componentView, for: configuration)
    }

    private static func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.placeholder = configuration.placeholder
        componentView.isSecureTextEntry = configuration.isSecure
        componentView.demoLeftView(configuration)
        componentView.leftViewMode = configuration.uiKitLeftViewMode
        componentView.demoRightView(configuration)
        componentView.rightViewMode = configuration.uiKitRightViewMode
        componentView.clearButtonMode = configuration.uiKitClearButtonMode
        componentView.isUserInteractionEnabled = configuration.uiKitIsUserInteractionEnabled
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityValue(configuration)
        componentView.demoBackground(configuration)
    }
}

// MARK: - Extension

extension TextFieldUIView {

    func demoLeftView<Configuration: TextFieldConfiguration>(
        _ configuration: Configuration
    ) {
        let view = TextFieldSideUIView.sideView(
            theme: configuration.theme,
            sideViewContent: configuration.leftViewContentType,
            side: .left,
            isAddon: false
        )
        self.leftView = view
    }

    func demoRightView<Configuration: TextFieldConfiguration>(
        _ configuration: Configuration
    ) {
        let view = TextFieldSideUIView.sideView(
            theme: configuration.theme,
            sideViewContent: configuration.rightViewContentType,
            side: .right,
            isAddon: false
        )
        self.rightView = view
    }
}
