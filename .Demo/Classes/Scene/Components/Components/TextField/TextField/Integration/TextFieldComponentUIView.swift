//
//  TextFieldComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
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
    typealias SideView = TextFieldSideUIView<Configuration, ComponentView, ConfigurationView, TextFieldComponentUIViewMaker>

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
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent
        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.placeholder = configuration.placeholder
        componentView.isSecureTextEntry = configuration.isSecure
        componentView.demoSideView(configuration, contentSide: .left, sideView: self.sideView)
        componentView.leftViewMode = configuration.uiKitLeftViewMode
        componentView.demoSideView(configuration, contentSide: .right, sideView: self.sideView)
        componentView.rightViewMode = configuration.uiKitRightViewMode
        componentView.clearButtonMode = configuration.uiKitClearButtonMode
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

extension TextFieldUIView {

    func demoSideView(
        _ configuration: TextFieldComponentUIViewMaker.Configuration,
        contentSide: TextFieldContentSide,
        sideView: TextFieldComponentUIViewMaker.SideView
    ) {
        let contentType = switch contentSide {
        case .left: configuration.leftViewContentType
        case .right: configuration.rightViewContentType
        }

        let view = sideView.createSideView(
            configuration: configuration,
            sideViewContent: contentType,
            side: contentSide,
            isAddon: false
        )

        switch contentSide {
        case .left:
            self.leftView = view
        case .right:
            self.rightView = view
        }
    }
}
