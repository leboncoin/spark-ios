//
//  StepperComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// MARK: - View Controller

typealias StepperComponentUIViewController = ComponentDisplayViewControllerRepresentable<StepperConfiguration, SparkUIStepper, StepperConfigurationView, StepperComponentUIViewMaker>

extension StepperComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class StepperComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = StepperConfiguration
    typealias ComponentView = SparkUIStepper
    typealias ConfigurationView = StepperConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, StepperComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?
    private var action: UIAction?
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            decrementImage: .init(icon: configuration.decrementIcon),
            incrementImage: .init(icon: configuration.incrementIcon)
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
        componentView.isContinuous = configuration.uiKitIsContinuous
        componentView.autoRepeat = configuration.uiKitIsAutoRepeat
        componentView.value = configuration.value().doubleValue
        componentView.minimumValue = configuration.bounds().doubleRange.lowerBound
        componentView.maximumValue = configuration.bounds().doubleRange.upperBound
        componentView.step = configuration.step().doubleValue
        componentView.demoValueNumberFormatter(configuration)
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoIncrementAccessibilityLabel(configuration)
        componentView.demoDecrementAccessibilityLabel(configuration)

        switch configuration.uiKitValueChangedType {
        case .action:
            let action = UIAction.init(handler: { [weak self] _ in
                self?.updateInfoLabel(with: componentView.value, configuration: configuration)
            })
            self.action = action

            componentView.addAction(action, for: .valueChanged)
            self.cancellables.removeAll()

        case .publisher:
            componentView.valuePublisher.sink { [weak self] value in
                self?.updateInfoLabel(with: componentView.value, configuration: configuration)
            }
            .store(in: &self.cancellables)

            if let action {
                componentView.removeAction(action, for: .valueChanged)
            }
        }

        self.updateInfoLabel(with: componentView.value, configuration: configuration)
    }

    private func updateInfoLabel(with value: Double, configuration: StepperConfiguration) {
        configuration.uiKitInfoLabel?.text = String(Int(value)) + " | " + configuration.uiKitValueChangedType.name
    }

    // MARK: - Getter

    func isInfoLabel() -> Bool {
        true
    }
}

// MARK: - Extension

private extension SparkUIStepper {

    func demoValueNumberFormatter(_ configuration: StepperConfiguration) {
        let formatter = NumberFormatter()

        switch configuration.format {
        case .currency:
            formatter.numberStyle = .currency
            formatter.currencyCode = "EUR"
            formatter.locale = .init(identifier: "fr_FR")

        case .percent:
            formatter.numberStyle = .percent

        case .none:
            formatter.numberStyle = .none
        }

        self.valueNumberFormatter = formatter
    }

    func demoIncrementAccessibilityLabel(_ configuration: StepperConfiguration) {
        let label = configuration.incrementAccessibilityLabel
        if !label.isEmpty {
            self.customIncrementAccessibilityLabel = label
        } else {
            self.customIncrementAccessibilityLabel = nil
        }
    }

    func demoDecrementAccessibilityLabel(_ configuration: StepperConfiguration) {
        let label = configuration.decrementAccessibilityLabel
        if !label.isEmpty {
            self.customDecrementAccessibilityLabel = label
        } else {
            self.customDecrementAccessibilityLabel = nil
        }
    }
}
