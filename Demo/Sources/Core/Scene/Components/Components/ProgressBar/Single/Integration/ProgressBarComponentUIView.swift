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

typealias ProgressBarComponentUIViewController = ComponentDisplayViewControllerRepresentable<ProgressBarConfiguration, SparkUIProgressBar, ProgressBarConfigurationView, ProgressBarComponentUIViewMaker, ProgressBarExtraTools>

extension ProgressBarComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class ProgressBarComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = ProgressBarConfiguration
    typealias ComponentView = SparkUIProgressBar
    typealias ConfigurationView = ProgressBarConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, ProgressBarComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = ProgressBarExtraTools

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
        componentView.intent = configuration.intent
        componentView.shape = configuration.shape
        componentView.value = configuration.cgFloatValue()
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoAccessibilityValue(configuration)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}
