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

typealias IconComponentUIViewController = ComponentDisplayViewControllerRepresentable<IconConfiguration, SparkUIIcon, IconConfigurationView, IconComponentUIViewMaker, IconExtraTools>

extension IconComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class IconComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = IconConfiguration
    typealias ComponentView = SparkUIIcon
    typealias ConfigurationView = IconConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, IconComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = IconExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            image: .init(icon: configuration.icon)
        )
        self.updateCommonProperties(componentView, for: configuration)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.image = .init(icon: configuration.icon)
        componentView.theme = configuration.theme.value
        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.intent = configuration.intent.toRealType(configuration)
        componentView.size = configuration.size.toRealType(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoIsAccessibilityElement(configuration)
    }
}
