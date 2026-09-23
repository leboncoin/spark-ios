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

typealias RatingDisplayComponentUIViewController = ComponentDisplayViewControllerRepresentable<RatingDisplayConfiguration, SparkUIRatingDisplay, RatingDisplayConfigurationView, RatingDisplayComponentUIViewMaker, RatingExtraTools>

extension RatingDisplayComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class RatingDisplayComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = RatingDisplayConfiguration
    typealias ComponentView = SparkUIRatingDisplay
    typealias ConfigurationView = RatingDisplayConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, RatingDisplayComponentUIViewMaker, ExtraTools>
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
        componentView.value = configuration.rating
        componentView.size = configuration.size
        componentView.stars = configuration.stars
        componentView.demoText(configuration)
        componentView.demoCountText(configuration)
        componentView.demoAdditionalText(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoAccessibilityValue(configuration)
    }
}

// MARK: - Extension

private extension SparkUIRatingDisplay {

    // MARK: - Setter

    func demoText(_ configuration: RatingDisplayComponentUIViewMaker.Configuration) {
        let text = configuration.text.nilIfEmpty
        if configuration.uiKitIsAttributedText {
            self.attributedText = text?.demoNSAttributedString
        } else if let text {
            self.text = text
        } else if self.attributedText != nil {
            self.attributedText = nil
        } else if self.text != nil {
            self.text = nil
        }
    }

    func demoCountText(_ configuration: RatingDisplayComponentUIViewMaker.Configuration) {
        let text = configuration.countText.nilIfEmpty
        if configuration.uiKitIsAttributedText {
            self.attributedCountText = text?.demoNSAttributedString
        } else if let text {
            self.countText = text
        } else if self.attributedText != nil {
            self.attributedCountText = nil
        } else if self.text != nil {
            self.countText = nil
        }
    }

    func demoAdditionalText(_ configuration: RatingDisplayComponentUIViewMaker.Configuration) {
        let text = configuration.additionalText.nilIfEmpty
        if configuration.uiKitIsAttributedText {
            self.attributedAdditionalText = text?.demoNSAttributedString
        } else if let text {
            self.additionalText = text
        } else if self.attributedText != nil {
            self.attributedAdditionalText = nil
        } else if self.text != nil {
            self.additionalText = nil
        }
    }
}
