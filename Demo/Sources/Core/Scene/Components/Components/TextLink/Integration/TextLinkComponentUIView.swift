//
//  TextLinkComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias TextLinkComponentUIViewController = ComponentDisplayViewControllerRepresentable<TextLinkConfiguration, SparkUITextLink, TextLinkConfigurationView, TextLinkComponentUIViewMaker, TextLinkExtraTools>

// MARK: - View Maker

final class TextLinkComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = TextLinkConfiguration
    typealias ComponentView = SparkUITextLink
    typealias ConfigurationView = TextLinkConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, TextLinkComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = TextLinkExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value
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
        componentView.intent = configuration.intent.toRealType(configuration)
        componentView.variant = configuration.variant
        componentView.typography = configuration.typography
        componentView.text = configuration.getText()
        componentView.image = .init(icon: configuration.icon)
        componentView.textLabel.textAlignment = configuration.uiKitTextAlignment
        componentView.textLabel.lineBreakMode = configuration.uiKitLineBreakMode
        componentView.textLabel.numberOfLines = configuration.numberOfLine
        if configuration.isLongText {
            componentView.textHighlightRange = configuration.getTextHighlightRange()
        }
        componentView.demoControlType(configuration, on: self.viewController)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoAccessibilityValue(configuration)
    }
}
