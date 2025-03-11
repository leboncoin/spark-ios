//
//  BadgeComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// TODO: Tox fix :
// - Constraints crash on TableView demo

// MARK: - View Controller

typealias BadgeComponentUIViewController = ComponentDisplayViewControllerRepresentable<BadgeConfiguration, BadgeUIView, BadgeConfigurationView, BadgeComponentUIViewMaker>

// MARK: - View Maker

final class BadgeComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = BadgeConfiguration
    typealias ComponentView = BadgeUIView
    typealias ConfigurationView = BadgeConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, BadgeComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            intent: configuration.intent,
            size: configuration.size,
            value: configuration.value,
            format: configuration.format.sparkValue(
                customText: configuration.customText,
                overflowValue: configuration.overflowValue
            ),
            isBorderVisible: configuration.isBorderVisible
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
        componentView.size = configuration.size
        componentView.value = configuration.value
        componentView.format = configuration.format.sparkValue(
            customText: configuration.customText,
            overflowValue: configuration.overflowValue
        )
        componentView.isBorderVisible = configuration.isBorderVisible
        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)
    }
}
