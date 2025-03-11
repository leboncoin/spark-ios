//
//  TextLinkComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// TODO: Tox fix :
// - add intrinsic content size
// - no multiline on configuration view ...

// MARK: - View Controller

typealias TextLinkComponentUIViewController = ComponentDisplayViewControllerRepresentable<TextLinkConfiguration, TextLinkUIView, TextLinkConfigurationView, TextLinkComponentUIViewMaker>

// MARK: - View Maker

final class TextLinkComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = TextLinkConfiguration
    typealias ComponentView = TextLinkUIView
    typealias ConfigurationView = TextLinkConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, TextLinkComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            text: configuration.getText(),
            intent: configuration.intent,
            typography: configuration.typography,
            variant: configuration.variant,
            image: .init(icon: configuration.icon)
        )
        self.updateCommonProperties(
            componentView,
            for: configuration
        )

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent
        componentView.variant = configuration.variant
        componentView.typography = configuration.typography
        componentView.text = configuration.getText()
        componentView.image = .init(icon: configuration.icon)
        self.updateCommonProperties(
            componentView,
            for: configuration
        )
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.alignment = configuration.alignment
        componentView.textAlignment = configuration.uiKitTextAlignment
        componentView.lineBreakMode = configuration.uiKitLineBreakMode
        componentView.numberOfLines = configuration.numberOfLine
        if configuration.isLongText {
            componentView.textHighlightRange = configuration.getTextHighlightRange()
        }
        componentView.demoControlType(configuration, on: self.viewController)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoAccessibilityValue(configuration)
        componentView.demoBackground(configuration)
    }
}
