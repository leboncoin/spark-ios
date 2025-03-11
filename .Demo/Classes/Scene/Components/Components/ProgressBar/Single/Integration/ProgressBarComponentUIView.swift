//
//  ProgressBarComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// MARK: - View Controller

typealias ProgressBarComponentUIViewController = ComponentDisplayViewControllerRepresentable<ProgressBarConfiguration, ProgressBarUIView, ProgressBarConfigurationView, ProgressBarComponentUIViewMaker>

extension ProgressBarComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class ProgressBarComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = ProgressBarConfiguration
    typealias ComponentView = ProgressBarUIView
    typealias ConfigurationView = ProgressBarConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, ProgressBarComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            intent: configuration.intent,
            shape: configuration.shape
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
        componentView.shape = configuration.shape

        self.updateCommonProperties(
            componentView,
            for: configuration
        )
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.value = configuration.cgFloatValue()
        componentView.demoAccessibilityLabel(configuration)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}
