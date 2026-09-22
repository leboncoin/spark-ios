//
//  SpinnerComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SpinnerComponentUIViewController = ComponentDisplayViewControllerRepresentable<SpinnerConfiguration, SparkUISpinner, SpinnerConfigurationView, SpinnerComponentUIViewMaker, SpinnerExtraTools>

extension SpinnerComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class SpinnerComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SpinnerConfiguration
    typealias ComponentView = SparkUISpinner
    typealias ConfigurationView = SpinnerConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SpinnerComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = SpinnerExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value
        )
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
        componentView.intent = configuration.intent.toRealType(configuration)
        componentView.size = configuration.size
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoIsAccessibilityElement(configuration)
    }
}
