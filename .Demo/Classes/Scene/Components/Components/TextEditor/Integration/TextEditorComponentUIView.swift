//
//  TextEditorComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias TextEditorComponentUIViewController = ComponentDisplayViewControllerRepresentable<TextEditorConfiguration, TextEditorUIView, TextEditorConfigurationView, TextEditorComponentUIViewMaker>

extension TextEditorComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class TextEditorComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = TextEditorConfiguration
    typealias ComponentView = TextEditorUIView
    typealias ConfigurationView = TextEditorConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, TextEditorComponentUIViewMaker>

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
        componentView.isEditable = configuration.uiKitIsEditable
        componentView.isScrollEnabled = configuration.uiKitIsScrollEnabled
        componentView.isEnabled = configuration.isEnabled.value

        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)
    }
}
