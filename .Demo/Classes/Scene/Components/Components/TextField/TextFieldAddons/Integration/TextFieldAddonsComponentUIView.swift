//
//  TextFieldAddonsComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
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
    typealias SideView = TextFieldSideUIView<Configuration, ComponentView, ConfigurationView, TextFieldAddonsComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?
    var sideView = SideView()

    // MARK: - Initialization

    init() {
        self.sideView.viewMaker = self
    }

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            intent: configuration.intent
        )
        self.updateCommonProperties(componentView, for: configuration)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.textField.theme = configuration.theme.value
        componentView.textField.intent = configuration.intent
        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.textField.placeholder = configuration.placeholder
        componentView.textField.isSecureTextEntry = configuration.isSecure

        componentView.demoSideView(
            configuration,
            contentSide: .left,
            isAddon: false,
            sideView: sideView
        )
        componentView.textField.leftViewMode = configuration.uiKitLeftViewMode
        componentView.demoSideView(
            configuration,
            contentSide: .right,
            isAddon: false,
            sideView: sideView
        )
        componentView.textField.rightViewMode = configuration.uiKitRightViewMode

        componentView.demoSideView(
            configuration,
            contentSide: .left,
            isAddon: true,
            sideView: self.sideView
        )
        componentView.demoSideView(
            configuration,
            contentSide: .right,
            isAddon: true,
            sideView: self.sideView
        )

        componentView.textField.rightViewMode = configuration.uiKitRightViewMode
        componentView.textField.clearButtonMode = configuration.uiKitClearButtonMode
        componentView.isReadOnly = configuration.isReadOnly
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}

// MARK: - Extension

extension TextFieldAddonsUIView {

    func demoSideView(
        _ configuration: TextFieldAddonsComponentUIViewMaker.Configuration,
        contentSide: TextFieldContentSide,
        isAddon: Bool,
        sideView: TextFieldAddonsComponentUIViewMaker.SideView
    ) {
        let contentType = switch (contentSide, isAddon) {
        case (.left, false):
            configuration.leftViewContentType
        case (.left, true):
            configuration.leftAddonContentType
        case (.right, false):
            configuration.rightViewContentType
        case (.right, true):
            configuration.rightAddonContentType
        }

        let view = sideView.createSideView(
            configuration: configuration,
            sideViewContent: contentType,
            side: contentSide,
            isAddon: isAddon
        )

        switch (contentSide, isAddon) {
        case (.left, false):
            self.textField.leftView = view
        case (.left, true):
            self.setLeftAddon(view, withPadding: configuration.isLeftAddonPadding)
        case (.right, false):
            self.textField.rightView = view
        case (.right, true):
            self.setRightAddon(view, withPadding: configuration.isRightAddonPadding)
        }
    }
}
