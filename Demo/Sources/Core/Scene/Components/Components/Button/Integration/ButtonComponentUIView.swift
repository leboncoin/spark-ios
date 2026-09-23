//
//  ButtonComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias ButtonComponentUIViewController = ComponentDisplayViewControllerRepresentable<ButtonConfiguration, SparkUIButton, ButtonConfigurationView, ButtonComponentUIViewMaker, ButtonExtraTools>

// MARK: - View Maker

final class ButtonComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = ButtonConfiguration
    typealias ComponentView = SparkUIButton
    typealias ConfigurationView = ButtonConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, ButtonComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = ButtonExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(theme: configuration.theme.value)
        self.updateCommonProperties(componentView, for: configuration)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.appearance = configuration.appearance
        componentView.intent = configuration.intent
        componentView.variant = configuration.variant
        componentView.shape = configuration.shape
        componentView.size = configuration.size
        componentView.alignment = configuration.alignment
        componentView.contentVisibility = configuration.contentVisibility
        componentView.hasFeedback = configuration.hasFeedback
        componentView.isLoading = configuration.isLoading
        componentView.removeStyles = configuration.removeStyles
        componentView.demoControlType(configuration, on: self.viewController)
        componentView.demoSetImage(configuration)
        componentView.demoSetTitle(configuration)
        componentView.demoSelected(configuration)
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)

        if configuration.animateIcon {
            UIView.animate(
                type: .bell,
                on: [
                    componentView.imageView
                ],
                repeat: .unlimited
            )
        }
    }
}

// MARK: - Extension

private extension SparkUIButton {

    func demoSetTitle(_ configuration: ButtonConfiguration) {
        self.setTitle(from: configuration.uiKitContentNormal, for: .normal)
        self.setTitle(from: configuration.uiKitContentHighlighted, for: .highlighted)
        self.setTitle(from: configuration.uiKitContentSelected, for: .selected)
        self.setTitle(from: configuration.uiKitContentDisabled, for: .disabled)
    }

    private func setTitle(from content: ButtonConfiguration.Content, for state: ButtonControlState) {
        guard !content.title.isEmpty else {
            return self.setTitle(nil, for: state.toUIControlState)
        }

        if content.isAttributedTitle {
            self.setTitle(nil, for: state.toUIControlState)
            self.setAttributedTitle(content.title.demoNSAttributedString, for: state.toUIControlState)
        } else {
            self.setAttributedTitle(nil, for: state.toUIControlState)
            self.setTitle(content.title, for: state.toUIControlState)
        }
    }

    func demoSetImage(_ configuration: ButtonConfiguration) {
        self.setImage(from: configuration.uiKitContentNormal, for: .normal)
        self.setImage(from: configuration.uiKitContentHighlighted, for: .highlighted)
        self.setImage(from: configuration.uiKitContentSelected, for: .selected)
        self.setImage(from: configuration.uiKitContentDisabled, for: .disabled)
    }

    private func setImage(from content: ButtonConfiguration.Content, for state: ButtonControlState) {
        self.setImage(.init(icon: content.icon), for: state.toUIControlState)
    }
}
