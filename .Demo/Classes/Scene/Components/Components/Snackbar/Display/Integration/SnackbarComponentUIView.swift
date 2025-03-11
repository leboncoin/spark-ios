//
//  SnackbarComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias SnackbarComponentUIViewController = ComponentDisplayViewControllerRepresentable<SnackbarConfiguration, SnackbarUIView, SnackbarConfigurationView, SnackbarComponentUIViewMaker>

extension SnackbarComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class SnackbarComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SnackbarConfiguration
    typealias ComponentView = SnackbarUIView
    typealias ConfigurationView = SnackbarConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SnackbarComponentUIViewMaker>

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
        componentView.variant = configuration.variant
        componentView.type = configuration.type
        componentView.label.text = configuration.text
        componentView.label.numberOfLines = configuration.maxNumberOfLines
        componentView.setImage(.init(icon: configuration.icon))

        switch configuration.contentType {
        case .button:
            componentView.addButton(configuration)
        default:
            componentView.removeButton()
        }

        componentView.demoAccessibilityLabel(configuration)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}

// MARK: - Extension

extension SnackbarUIView {

    func addButton(_ configuration: SnackbarComponentUIViewMaker.Configuration) {
        let button = self.addButton()
        button.setTitle(configuration.buttonTitle, for: .normal)
    }
}
