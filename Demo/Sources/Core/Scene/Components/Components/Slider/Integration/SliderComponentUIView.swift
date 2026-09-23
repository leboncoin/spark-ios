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

// MARK: - View Controller

typealias SliderComponentUIViewController = ComponentDisplayViewControllerRepresentable<SliderConfiguration, SparkUISlider, SliderConfigurationView, SliderComponentUIViewMaker, SliderExtraTools>

extension SliderComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class SliderComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SliderConfiguration
    typealias ComponentView = SparkUISlider
    typealias ConfigurationView = SliderConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SliderComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = SliderExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?
    private var cancellables = Set<AnyCancellable>()

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

        componentView.valueChangedPublisher.sink { value in
            configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: value)
            componentView.demoValueText(configuration)
        }
        .store(in: &self.cancellables)

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
        let value = configuration.value()

        componentView.intent = configuration.intent
        componentView.isContinuous = configuration.uiKitIsContinuous
        componentView.isFloatingValueLabel = configuration.isFloatingValueLabel
        componentView.value = value
        componentView.minimumValue = configuration.minimumValue
        componentView.maximumValue = configuration.maximumValue
        componentView.demoStep(configuration)
        componentView.demoTitle(configuration)
        componentView.demoValueText(configuration)
        componentView.demoRangeValuesText(configuration)
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoAccessibilityValue(configuration, canSetNil: true)

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

// MARK: - Extension

private extension SparkUISlider {

    // MARK: - Setter

    func demoStep(_ configuration: SliderComponentUIViewMaker.Configuration) {
        if configuration.isStep {
            self.step = configuration.step()
        } else {
            self.step = nil
        }
    }

    func demoTitle(_ configuration: SliderComponentUIViewMaker.Configuration) {
        let text = configuration.titleString.nilIfEmpty

        if let text, configuration.uiKitIsAttributedText {
            self.attributedTitle = text.demoNSAttributedString
        } else {
            self.title = text
        }
    }

    func demoValueText(_ configuration: SliderComponentUIViewMaker.Configuration) {
        let text = configuration.customValueLabel.nilIfEmpty ?? configuration.getFormattedValue(from: self.value)

        if !configuration.isValueLabel {
            self.valueText = nil
        } else if configuration.uiKitIsAttributedText {
            self.attributedValueText = text.demoNSAttributedString
        } else {
            self.valueText = text
        }
    }

    func demoRangeValuesText(_ configuration: SliderComponentUIViewMaker.Configuration) {
        let minimumText = configuration.lowerBoundString
        let maximumText = configuration.upperBoundString

        if !configuration.isRangeValuesLabel {
            self.minimumRangeValueText = nil
            self.maximumRangeValueText = nil
        } else if configuration.uiKitIsAttributedText {
            self.attributedMinimumRangeValueText = minimumText.demoNSAttributedString
            self.attributedMaximumRangeValueText = maximumText.demoNSAttributedString
        } else {
            self.minimumRangeValueText = minimumText
            self.maximumRangeValueText = maximumText
        }
    }
}
