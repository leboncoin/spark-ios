//
//  ProgressBarIndeterminateComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// MARK: - View Controller

typealias ProgressBarIndeterminateComponentUIViewController = ComponentDisplayViewControllerRepresentable<ProgressBarIndeterminateConfiguration, SparkUIProgressBarIndeterminate, ProgressBarIndeterminateConfigurationView, ProgressBarIndeterminateComponentUIViewMaker, ProgressBarExtraTools>

extension ProgressBarIndeterminateComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class ProgressBarIndeterminateComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = ProgressBarIndeterminateConfiguration
    typealias ComponentView = SparkUIProgressBarIndeterminate
    typealias ConfigurationView = ProgressBarIndeterminateConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, ProgressBarIndeterminateComponentUIViewMaker, ExtraTools>
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
        if configuration.isAnimating {
            componentView.startAnimating()
        } else {
            componentView.stopAnimating()
        }

        componentView.intent = configuration.intent
        componentView.shape = configuration.shape
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoIsAccessibilityElement(configuration)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}
