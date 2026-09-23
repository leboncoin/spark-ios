//
//  ToggleComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ToggleComponentUIViewController = ComponentDisplayViewControllerRepresentable<ToggleConfiguration, SparkUISwitch, ToggleConfigurationView, ToggleComponentUIViewMaker, ToggleExtraTools>

extension ToggleComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class ToggleComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = ToggleConfiguration
    typealias ComponentView = SparkUISwitch
    typealias ConfigurationView = ToggleConfigurationView
    typealias ExtraTools = ToggleExtraTools
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, ToggleComponentUIViewMaker, ExtraTools>

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
        componentView.demoControlType(
            configuration,
            event: .valueChanged,
            on: self.viewController
        )
        componentView.demoIsOn(configuration)
        componentView.demoDisabled(configuration)
        componentView.demoText(configuration)
        componentView.demoAccessibilityLabel(configuration)
    }
}

// MARK: - Extension

private extension SparkUISwitch {

    // MARK: - Methods

    func demoText(_ configuration: ToggleComponentUIViewMaker.Configuration) {
        let isText = !configuration.text.isEmpty
        let isAttributedText = configuration.uiKitIsAttributedText

        switch (isText, isAttributedText) {
        case (true, false): // Text
            self.text = configuration.text

        case (true, true): // Attributed Text
            self.attributedText = configuration.text.demoNSAttributedString

        default: // No Text
            self.text = nil
            self.attributedText = nil
        }
    }

    func demoIsOn(_ configuration: ToggleComponentUIViewMaker.Configuration) {
        if configuration.uiKitIsAnimated {
            self.setOn(configuration.uiKitIsOn, animated: true)
        } else {
            self.isOn = configuration.uiKitIsOn
        }
    }
}
