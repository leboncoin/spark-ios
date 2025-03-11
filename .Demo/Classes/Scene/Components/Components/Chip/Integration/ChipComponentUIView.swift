//
//  ChipComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// TODO: To Fix
// Remove enableComponentUserInteraction
// Remove action

// MARK: - View Controller

typealias ChipComponentUIViewController = ComponentDisplayViewControllerRepresentable<ChipConfiguration, ChipUIView, ChipConfigurationView, ChipComponentUIViewMaker>

// MARK: - View Maker

final class ChipComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = ChipConfiguration
    typealias ComponentView = ChipUIView
    typealias ConfigurationView = ChipConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, ChipComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let isLabel = !configuration.text.isEmpty
        let componentView = switch (isLabel, configuration.icon) {
        case (true, let icon?):
            ComponentView(
                theme: configuration.theme.value,
                intent: configuration.intent,
                variant: configuration.variant,
                alignment: configuration.alignment,
                label: configuration.text,
                iconImage: .init(icon: icon)
            )

        case (false, let icon?):
            ComponentView(
                theme: configuration.theme.value,
                intent: configuration.intent,
                variant: configuration.variant,
                alignment: configuration.alignment,
                iconImage: .init(icon: icon)
            )

        case (true, nil):
            ComponentView(
                theme: configuration.theme.value,
                intent: configuration.intent,
                variant: configuration.variant,
                alignment: configuration.alignment,
                label: configuration.text
            )

        case (false, .none):
            ComponentView(
                theme: configuration.theme.value,
                intent: configuration.intent,
                variant: configuration.variant,
                alignment: configuration.alignment,
                label: "Title is required"
            )
        }
        self.updateCommonProperties(componentView, for: configuration)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent
        componentView.variant = configuration.variant
        componentView.alignment = configuration.alignment
        componentView.icon = .init(icon: configuration.icon)
        componentView.text = configuration.text.isEmpty ? nil : configuration.text

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoControlType(configuration, on: self.viewController)
        componentView.demoBadgeComponent(configuration)
        componentView.isSelected = configuration.isSelected
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)
    }
}

// MARK: - Extension

private extension ChipUIView {

    func demoBadgeComponent(_ configuration: ChipConfiguration) {
        if configuration.withExtraComponent {
            let maker = BadgeComponentUIViewMaker()

            self.component = maker.createComponentView(
                for: configuration.badgeConfiguration
            )
        } else {
            self.component = nil
        }
    }
}

