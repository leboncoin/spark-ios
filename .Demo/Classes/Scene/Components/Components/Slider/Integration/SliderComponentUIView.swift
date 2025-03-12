//
//  SliderComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
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
        self.init(style: .verticalList, styles: [.alone, .verticalList])
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

    weak var viewController: DisplayViewController?
    private var cancellables = Set<AnyCancellable>()

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

        componentView.valuePublisher.sink { value in
            configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: value)
        }
        .store(in: &self.cancellables)

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
        componentView.demoAccessibilityLabel(configuration)

        configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: value)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }

    func isInfoLabel() -> Bool {
        true
    }
}
