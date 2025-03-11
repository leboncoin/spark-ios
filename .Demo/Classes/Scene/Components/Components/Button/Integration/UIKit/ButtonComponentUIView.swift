//
//  ButtonComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias ButtonComponentUIViewController = ComponentDisplayViewControllerRepresentable<ButtonConfiguration, ButtonUIView, ButtonConfigurationView, ButtonComponentUIViewMaker>

// MARK: - View Maker

final class ButtonComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = ButtonConfiguration
    typealias ComponentView = ButtonUIView
    typealias ConfigurationView = ButtonConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, ButtonComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            intent: configuration.intent,
            variant: configuration.variant,
            size: configuration.size,
            shape: configuration.shape,
            alignment: configuration.alignment
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
        componentView.variant = configuration.variant
        componentView.size = configuration.size
        componentView.shape = configuration.shape
        componentView.alignment = configuration.alignment

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoControlType(configuration, on: self.viewController)
        componentView.demoSetImage(configuration)
        componentView.demoSetTitle(configuration)
        componentView.isAnimated = configuration.uiKitIsAnimated
        componentView.demoSelected(configuration)
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)
    }
}

// MARK: - Extension

private extension ButtonUIView {

    func demoSetTitle(_ configuration: ButtonConfiguration) {
        self.setTitle(from: configuration.contentNormal, for: .normal)
        self.setTitle(from: configuration.contentHighlighted, for: .highlighted)
        self.setTitle(from: configuration.contentSelected, for: .selected)
        self.setTitle(from: configuration.contentDisabled, for: .disabled)
    }

    private func setTitle(from content: ButtonConfiguration.Content, for state: ControlState) {
        guard !content.title.isEmpty else {
            return self.setTitle(nil, for: state)
        }

        if content.isAttributedTitle {
            self.setTitle(nil, for: state)
            self.setAttributedTitle(content.title.demoNSAttributedString, for: state)
        } else {
            self.setAttributedTitle(nil, for: state)
            self.setTitle(content.title, for: state)
        }
    }
}
