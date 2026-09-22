//
//  RadioButtonComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// MARK: - View Controller

typealias RadioButtonComponentUIViewController = ComponentDisplayViewControllerRepresentable<RadioButtonConfiguration, SparkUIRadioButton, RadioButtonConfigurationView, RadioButtonComponentUIViewMaker, RadioButtonExtraTools>

extension RadioButtonComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class RadioButtonComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = RadioButtonConfiguration
    typealias ComponentView = SparkUIRadioButton
    typealias ConfigurationView = RadioButtonConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, RadioButtonComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = RadioButtonExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(theme: configuration.theme.value)
        self.updateCommonProperties(componentView, for: configuration)

        configuration.uiKitActionButton?.setTitle("Reset", for: .normal)
        configuration.uiKitActionButton?.addAction(.init(handler: { _ in
            configuration.uiKitIsSelected.value = false
            componentView.demoIsSelected(configuration)
        }), for: .touchUpInside)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value
        componentView.demoText(configuration)

        self.updateCommonProperties(componentView, for: configuration)
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
        componentView.intent = configuration.intent
        componentView.demoIsSelected(configuration)
        componentView.demoDisabled(configuration)
        componentView.demoText(configuration)
        componentView.demoAccessibilityLabel(configuration)
    }

    func isResetButton() -> Bool {
        true
    }
}

// MARK: - Extension

private extension SparkUIRadioButton {

    func demoText(_ configuration: RadioButtonConfiguration) {
        if configuration.uiKitIsAttributedText {
            self.attributedText = configuration.text.demoNSAttributedString
        } else {
            self.text = configuration.text
        }
    }

    func demoIsSelected(_ configuration: RadioButtonConfiguration) {
        if configuration.isAnimated {
            self.setIsSelected(configuration.uiKitIsSelected.value, animated: true)
        } else {
            self.isSelected = configuration.uiKitIsSelected.value
        }
    }
}
