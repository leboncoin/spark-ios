//
//  IconComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// TODO: To Fix
// - Constraints crash on TableView demo

// MARK: - View Controller

typealias IconComponentUIViewController = ComponentDisplayViewControllerRepresentable<IconConfiguration, IconUIView, IconConfigurationView, IconComponentUIViewMaker>

extension IconComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class IconComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = IconConfiguration
    typealias ComponentView = IconUIView
    typealias ConfigurationView = IconConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, IconComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            iconImage: .init(icon: configuration.icon),
            theme: configuration.theme.value,
            intent: configuration.intent,
            size: configuration.size
        )
        self.updateCommonProperties(componentView, for: configuration)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.icon = .init(icon: configuration.icon)
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent
        componentView.size = configuration.size
        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)
    }
}
