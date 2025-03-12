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

// TODO: To Fix
// Remove isEnabled on init
// Remove delegate

// MARK: - Component

typealias RadioButtonIntUIView = RadioButtonUIView<Int>

// MARK: - View Controller

typealias RadioButtonComponentUIViewController = ComponentDisplayViewControllerRepresentable<RadioButtonConfiguration, RadioButtonIntUIView, RadioButtonConfigurationView, RadioButtonComponentUIViewMaker>

// MARK: - View Maker

final class RadioButtonComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = RadioButtonConfiguration
    typealias ComponentView = RadioButtonIntUIView
    typealias ConfigurationView = RadioButtonConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, RadioButtonComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {

        let componentView = ComponentView(
            theme: configuration.theme.value,
            intent: configuration.intent,
            id: 1,
            label: configuration.uiKitIsAttributedText ? configuration.text.demoNSAttributedString : NSAttributedString(string: configuration.text),
            isSelected: configuration.uiKitIsSelected.value,
            labelAlignment: configuration.labelAlignment
        )

        componentView.publisher.sink { value in
            configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: value ? componentView.id : nil)
        }
        .store(in: &self.cancellables)

        self.updateCommonProperties(componentView, for: configuration)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent
        componentView.demoText(configuration)
        componentView.demoSelected(configuration)
        componentView.labelAlignment = configuration.labelAlignment

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)

        configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: componentView.isSelected ? componentView.id : nil)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }

    func isInfoLabel() -> Bool {
        true
    }
}

// MARK: - Extension

private extension RadioButtonUIView {

    func demoText(_ configuration: RadioButtonConfiguration) {
        if configuration.uiKitIsAttributedText {
            self.attributedText = configuration.text.demoNSAttributedString
        } else {
            self.text = configuration.text
        }
    }
}

