//
//  IconButtonComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias IconButtonComponentUIViewController = ComponentDisplayViewControllerRepresentable<IconButtonConfiguration, IconButtonUIView, IconButtonConfigurationView, IconButtonComponentUIViewMaker>

// MARK: - View Maker

final class IconButtonComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = IconButtonConfiguration
    typealias ComponentView = IconButtonUIView
    typealias ConfigurationView = IconButtonConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, IconButtonComponentUIViewMaker>

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
            shape: configuration.shape
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

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoControlType(configuration, on: self.viewController)
        componentView.demoSetImage(configuration)
        componentView.isAnimated = configuration.uiKitIsAnimated
        componentView.demoSelected(configuration)
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)
    }
}
