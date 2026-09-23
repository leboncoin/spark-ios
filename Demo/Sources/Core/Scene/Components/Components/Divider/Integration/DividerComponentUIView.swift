//
//  DividerComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias DividerComponentUIViewController = ComponentDisplayViewControllerRepresentable<DividerConfiguration, SparkUIDivider, DividerConfigurationView, DividerComponentUIViewMaker, DividerExtraTools>

// MARK: - View Maker

final class DividerComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = DividerConfiguration
    typealias ComponentView = SparkUIDivider
    typealias ConfigurationView = DividerConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, DividerComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = DividerExtraTools

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
        componentView.alignment = configuration.alignment
        componentView.axis = configuration.axis
        componentView.intent = configuration.intent
        componentView.demoLabel(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoHeight(configuration)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}

// MARK: - Extension

private extension SparkUIDivider {

    func demoLabel(_ configuration: DividerComponentUIViewMaker.Configuration) {
        let text = configuration.text.nilIfEmpty
        if configuration.uiKitIsAttributedText {
            self.attributedText = text?.demoNSAttributedString
        } else if let text {
            self.text = text
        } else if self.attributedText != nil {
            self.attributedText = nil
        } else if self.text != nil {
            self.text = nil
        }
    }

    func demoHeight(_ configuration: DividerComponentUIViewMaker.Configuration) {
        self.frame.size.height = configuration.axis.height
    }
}
