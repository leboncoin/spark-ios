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

typealias DividerComponentUIViewController = ComponentDisplayViewControllerRepresentable<DividerConfiguration, DividerUIView, DividerConfigurationView, DividerComponentUIViewMaker>

// MARK: - View Maker

final class DividerComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = DividerConfiguration
    typealias ComponentView = DividerUIView
    typealias ConfigurationView = DividerConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, DividerComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

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
        componentView.axis = configuration.axis
        componentView.alignment = configuration.alignment
        componentView.demoLabel(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)
        componentView.demoHeight(configuration)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}

// MARK: - Extension

private extension DividerUIView {

    func demoLabel(_ configuration: DividerComponentUIViewMaker.Configuration) {
        self.showLabel = !configuration.text.isEmpty
        self.label.text = configuration.text
    }

    func demoHeight(_ configuration: DividerComponentUIViewMaker.Configuration) {
        self.frame.size.height = configuration.axis.height
    }
}

private extension DividerAxis {

    var height: CGFloat {
        switch self {
        case .horizontal: 50
        case .vertical: 200
        }
    }
}
