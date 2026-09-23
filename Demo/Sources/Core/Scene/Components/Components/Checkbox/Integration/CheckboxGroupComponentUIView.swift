//
//  CheckboxGroupComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// MARK: - Component

typealias SparkUICheckboxGroupInt = SparkUICheckboxGroup<Int>

// MARK: - View Controller

typealias CheckboxGroupComponentUIViewController = ComponentDisplayViewControllerRepresentable<CheckboxGroupConfiguration, SparkUICheckboxGroupInt, CheckboxGroupConfigurationView, CheckboxGroupComponentUIViewMaker, CheckboxExtraTools>

extension CheckboxGroupComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class CheckboxGroupComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = CheckboxGroupConfiguration
    typealias ComponentView = SparkUICheckboxGroupInt
    typealias ConfigurationView = CheckboxGroupConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, CheckboxGroupComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = CheckboxExtraTools

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

        componentView.selectedIDsChangedPublisher.sink { value in
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
        componentView.demoSelectedIDs(configuration)
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)

        configuration.uiKitInfoLabel?.text = configuration.getInfoValue(
            from: configuration.items.filter(\.uikitIsSelected).map(\.id)
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

private extension SparkUICheckboxGroup<Int> {

    func demoItems(_ configuration: CheckboxGroupConfiguration) {
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

    func demoSelectedIDs(_ configuration: CheckboxGroupConfiguration) {
        let selectedIDs = configuration.items.filter(\.uikitIsSelected).map(\.id)

        if configuration.uiKitCanAnimated {
            self.selectedIDs = selectedIDs
        } else {
            self.setSelectedIDs(selectedIDs, animated: configuration.uiKitIsAnimated)
        }
    }
}
