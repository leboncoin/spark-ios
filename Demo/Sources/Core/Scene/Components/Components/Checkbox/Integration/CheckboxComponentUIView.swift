//
//  CheckboxComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// MARK: - View Controller

typealias CheckboxComponentUIViewController = ComponentDisplayViewControllerRepresentable<CheckboxConfiguration, SparkUICheckbox, CheckboxConfigurationView, CheckboxComponentUIViewMaker, CheckboxExtraTools>

extension CheckboxComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class CheckboxComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = CheckboxConfiguration
    typealias ComponentView = SparkUICheckbox
    typealias ConfigurationView = CheckboxConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, CheckboxComponentUIViewMaker, ExtraTools>
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

        configuration.uiKitActionButton?.setTitle("Reset indeterminate", for: .normal)
        configuration.uiKitActionButton?.addAction(.init(handler: { _ in
            configuration.uiKitSelectionState = .indeterminate
            configuration.uiKitIsSelected.value = false
            componentView.demoIsSelected(configuration)

            configuration.uiKitInfoLabel?.text = configuration.getUIKitInfoValue(
                from: configuration.uiKitSelectionState
            )

        }), for: .touchUpInside)

        componentView.selectionStatePublisher.sink { value in
            configuration.uiKitInfoLabel?.text = configuration.getUIKitInfoValue(from: value)
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
        componentView.demoIsSelected(configuration)
        componentView.demoDisabled(configuration)
        componentView.demoText(configuration)
        componentView.demoAccessibilityLabel(configuration)

        configuration.uiKitInfoLabel?.text = configuration.getUIKitInfoValue(
            from: configuration.uiKitSelectionState
        )
    }

    func isInfoLabel() -> Bool {
        true
    }

    func isResetButton() -> Bool {
        true
    }
}

// MARK: - Extension

private extension SparkUICheckbox {

    func demoText(_ configuration: CheckboxConfiguration) {
        if configuration.uiKitIsAttributedText {
            self.attributedText = configuration.text.demoNSAttributedString
        } else {
            self.text = configuration.text
        }
    }

    func demoIsSelected(_ configuration: CheckboxConfiguration) {
        switch (configuration.uiKitIsAnimated, configuration.uiKitUseSelectionState) {
        case (true, true):
            self.setSelectionState(configuration.uiKitSelectionState, animated: true)

        case (true, false):
            self.setIsSelected(configuration.uiKitIsSelected.value, animated: true)

        case (false, true):
            self.selectionState = configuration.uiKitSelectionState

        case (false, false):
            self.isSelected = configuration.uiKitIsSelected.value
        }
    }
}
