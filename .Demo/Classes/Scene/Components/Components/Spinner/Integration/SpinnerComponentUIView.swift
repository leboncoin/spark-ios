//
//  SpinnerComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SpinnerComponentUIViewController = ComponentDisplayViewControllerRepresentable<SpinnerConfiguration, SpinnerUIView, SpinnerConfigurationView, SpinnerComponentUIViewMaker>

extension SpinnerComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class SpinnerComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SpinnerConfiguration
    typealias ComponentView = SpinnerUIView
    typealias ConfigurationView = SpinnerConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SpinnerComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        return .init(
            theme: configuration.theme.value,
            intent: configuration.intent,
            spinnerSize: configuration.spinnerSize
        )
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent
        componentView.spinnerSize = configuration.spinnerSize
        componentView.demoAccessibilityLabel(configuration)
    }
}
