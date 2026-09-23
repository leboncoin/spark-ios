//
//  RadioGroupComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// MARK: - Component

typealias SparkUIRadioGroupInt = SparkUIRadioGroup<Int>

// MARK: - View Controller

typealias RadioGroupComponentUIViewController = ComponentDisplayViewControllerRepresentable<RadioGroupConfiguration, SparkUIRadioGroupInt, RadioGroupConfigurationView, RadioGroupComponentUIViewMaker, RadioButtonExtraTools>

extension RadioGroupComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class RadioGroupComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = RadioGroupConfiguration
    typealias ComponentView = SparkUIRadioGroupInt
    typealias ConfigurationView = RadioGroupConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, RadioGroupComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = RadioButtonExtraTools

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
        self.updateCommonProperties(componentView, for: configuration)

        componentView.selectedIDChangedPublisher.sink { value in
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
        componentView.axis = configuration.axis
        componentView.demoItems(configuration)
        componentView.demoSelectedID(configuration)
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)

        configuration.uiKitInfoLabel?.text = configuration.getInfoValue(
            from: configuration.uiKitSelectedId
        )
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

private extension SparkUIRadioGroup<Int> {

    func demoItems(_ configuration: RadioGroupConfiguration) {
        self.items = configuration.items.map {
            if $0.isAttributedText {
                .init(
                    id: $0.id,
                    attributedText: $0.getText().demoNSAttributedString,
                    isEnabled: $0.isEnabled
                    )
            } else {
                .init(
                    id: $0.id,
                    text: $0.getText(),
                    isEnabled: $0.isEnabled
                )
            }
        }
    }

    func demoSelectedID(_ configuration: RadioGroupConfiguration) {
        let selectedID = configuration.items.first { $0.id == configuration.uiKitSelectedId }.map(\.id)

        if configuration.uiKitCanAnimated {
            self.selectedID = selectedID
        } else {
            self.setSelectedID(selectedID, animated: configuration.isAnimated)
        }
    }
}
