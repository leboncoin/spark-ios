//
//  RatingDisplayComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// MARK: - View Controller

typealias RatingDisplayComponentUIViewController = ComponentDisplayViewControllerRepresentable<RatingDisplayConfiguration, RatingDisplayUIView, RatingDisplayConfigurationView, RatingDisplayComponentUIViewMaker>

extension RatingDisplayComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class RatingDisplayComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = RatingDisplayConfiguration
    typealias ComponentView = RatingDisplayUIView
    typealias ConfigurationView = RatingDisplayConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, RatingDisplayComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            intent: configuration.intent,
            count: configuration.numberOfStars,
            size: configuration.size,
            rating: configuration.rating
        )
        self.updateCommonProperties(componentView, for: configuration)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent
        componentView.count = configuration.numberOfStars
        componentView.size = configuration.size
        componentView.rating = configuration.rating
        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoAccessibilityLabel(configuration)
    }
}
