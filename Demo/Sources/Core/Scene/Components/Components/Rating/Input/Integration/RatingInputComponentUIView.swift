//
//  RatingInputComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias RatingInputComponentUIViewController = ComponentDisplayViewControllerRepresentable<RatingInputConfiguration, SparkUIRatingInput, RatingInputConfigurationView, RatingInputComponentUIViewMaker, RatingExtraTools>

extension RatingInputComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class RatingInputComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = RatingInputConfiguration
    typealias ComponentView = SparkUIRatingInput
    typealias ConfigurationView = RatingInputConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, RatingInputComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = RatingExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value
        )
        self.updateCommonProperties(componentView, for: configuration)

        componentView.addAction(.init(handler: { _ in
            configuration.uiKitRating = componentView.value
            configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: componentView.value)
        }), for: .valueChanged)

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
        componentView.value = configuration.uiKitRating
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoAccessibilityValue(configuration)

        configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: configuration.uiKitRating)
    }

    // MARK: - Getter

    func isInfoLabel() -> Bool {
        true
    }
}
