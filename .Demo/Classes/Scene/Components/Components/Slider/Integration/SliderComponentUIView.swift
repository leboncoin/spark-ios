//
//  SliderComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// MARK: - Component

typealias SliderFloatUIView = SliderUIControl<Float>

// MARK: - View Controller

typealias SliderComponentUIViewController = ComponentDisplayViewControllerRepresentable<SliderConfiguration, SliderFloatUIView, SliderConfigurationView, SliderComponentUIViewMaker>

extension SliderComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class SliderComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SliderConfiguration
    typealias ComponentView = SliderFloatUIView
    typealias ConfigurationView = SliderConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SliderComponentUIViewMaker>

    // MARK: - Properties

    let fullWidth = true
    weak var viewController: DisplayViewController?
    private var infoLabel = UILabel()
    private var cancellable: AnyCancellable?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            shape: configuration.shape,
            intent: configuration.intent
        )
        self.updateCommonProperties(
            componentView,
            for: configuration
        )

        self.cancellable?.cancel()
        self.cancellable = componentView.valuePublisher.sink { [weak self] value in
            guard let self else { return }

            self.infoLabel.text = String.currentValue(value)
        }

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
        let value = configuration.value()

        componentView.isContinuous = configuration.uiKitIsContinuous
        componentView.setValue(value)
        componentView.range = configuration.bounds()
        componentView.step = configuration.step()
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityValue(configuration)

        self.infoLabel.text = String.currentValue(value)
    }

    func createComponentInfoLabel(for configuration: Configuration) -> UILabel? {
        return self.infoLabel
    }
}

private extension String {

    static func currentValue(_ value: Float) -> Self {
        "Value \(String(format: "%.2f", value))"
    }
}
