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

// TODO: To Fix
// Remove delegate & publisher

// MARK: - View Controller

typealias CheckboxGroupComponentUIViewController = ComponentDisplayViewControllerRepresentable<CheckboxGroupConfiguration, CheckboxGroupUIView, CheckboxGroupConfigurationView, CheckboxGroupComponentUIViewMaker>

extension CheckboxGroupComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class CheckboxGroupComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = CheckboxGroupConfiguration
    typealias ComponentView = CheckboxGroupUIView
    typealias ConfigurationView = CheckboxGroupConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, CheckboxGroupComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            title: configuration.title.isEmpty ? nil : configuration.title,
            checkedImage: .init(icon: configuration.checkedIcon),
            items: configuration.items.map { $0.toSpark(for: .uiKit) },
            layout: configuration.layout,
            alignment: configuration.alignment,
            theme: configuration.theme.value,
            intent: configuration.intent
        )
        self.updateCommonProperties(componentView, for: configuration)

        componentView.publisher.sink { value in
            configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: componentView.checkboxes.map(\.selectionState))
        }
        .store(in: &self.cancellables)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoTitle(configuration)
        componentView.checkedImage = .init(icon: configuration.checkedIcon)
        componentView.updateItems(configuration.items.map { $0.toSpark(for: .uiKit)})
        componentView.layout = configuration.layout
        componentView.alignment = configuration.alignment
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)

        configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: componentView.checkboxes.map(\.selectionState))
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

private extension CheckboxGroupUIView {

    func demoTitle(_ configuration: CheckboxGroupConfiguration) {
        if configuration.title.isEmpty {
            self.title = nil
        } else {
            self.title = configuration.title
        }
    }
}
