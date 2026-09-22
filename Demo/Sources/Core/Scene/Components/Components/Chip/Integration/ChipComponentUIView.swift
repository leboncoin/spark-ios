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

typealias ChipComponentUIViewController = ComponentDisplayViewControllerRepresentable<ChipConfiguration, SparkUIChip, ChipConfigurationView, ChipComponentUIViewMaker, ChipExtraTools>

// MARK: - View Maker

final class ChipComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = ChipConfiguration
    typealias ComponentView = SparkUIChip
    typealias ConfigurationView = ChipConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, ChipComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = ChipExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(theme: configuration.theme.value)
        self.updateCommonProperties(componentView, for: configuration)

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
        componentView.intent = configuration.intent
        componentView.variant = configuration.variant
        componentView.alignment = configuration.alignment
        componentView.size = configuration.size
        componentView.icon = .init(icon: configuration.icon)
        componentView.demoControlType(configuration, on: self.viewController)
        componentView.demoBadgeComponent(configuration)
        componentView.demoText(configuration)
        componentView.isSelected = configuration.isSelected
        componentView.demoDisabled(configuration)
        componentView.demoAccessibility(configuration)
    }
}

// MARK: - Extension

private extension SparkUIChip {

    func demoIcon(_ configuration: TagComponentUIViewMaker.Configuration) {
        let newIcon = configuration.icon
        if let newIcon {
            self.icon = .init(icon: newIcon)
        } else if self.icon != nil {
            self.icon = nil
        }
    }

    func demoText(_ configuration: ChipConfiguration) {
        guard let text = configuration.text.nilIfEmpty else {
            self.text = nil
            return
        }

        if configuration.uiKitIsAttributedText {
            self.attributedText = text.demoNSAttributedString
        } else {
            self.text = text
        }
    }

    func demoBadgeComponent(_ configuration: ChipConfiguration) {
        if configuration.withExtraComponent {
            let maker = BadgeComponentUIViewMaker()

            self.extraContent = maker.createComponentView(
                for: configuration.badgeConfiguration
            )
        } else {
            self.extraContent = nil
        }
    }
}
