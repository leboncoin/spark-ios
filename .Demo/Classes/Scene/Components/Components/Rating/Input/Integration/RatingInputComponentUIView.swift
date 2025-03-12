//
//  RatingInputComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// MARK: - View Controller

typealias RatingInputComponentUIViewController = ComponentDisplayViewControllerRepresentable<RatingInputConfiguration, RatingInputUIView, RatingInputConfigurationView, RatingInputComponentUIViewMaker>

extension RatingInputComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class RatingInputComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = RatingInputConfiguration
    typealias ComponentView = RatingInputUIView
    typealias ConfigurationView = RatingInputConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, RatingInputComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            intent: configuration.intent,
            rating: configuration.uiKitRating
        )
        self.updateCommonProperties(componentView, for: configuration)

        componentView.publisher.sink { value in
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
        componentView.intent = configuration.intent
        componentView.rating = configuration.uiKitRating
        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)

        configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: configuration.uiKitRating)
    }

    // MARK: - Getter

    func isInfoLabel() -> Bool {
        true
    }
}
