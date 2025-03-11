//
//  TagComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// TODO: Tox fix :
// - Fix accessibilty : add accessibility for the component and remove the listener on UILabel,
// TODO: constraints break when clear entire text

// MARK: - View Controller

typealias TagComponentUIViewController = ComponentDisplayViewControllerRepresentable<TagConfiguration, TagUIView, TagConfigurationView, TagComponentUIViewMaker>

// MARK: - View Maker

final class TagComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = TagConfiguration
    typealias ComponentView = TagUIView
    typealias ConfigurationView = TagConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, TagComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(configuration: configuration)
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
        componentView.demoIcon(configuration)
        componentView.demoText(configuration)
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

// MARK: - Extension

private extension TagUIView {

    // MARK: - Initialization

    convenience init(configuration: TagComponentUIViewMaker.Configuration) {
        let iconImage = UIImage(icon: configuration.icon)
        let text = configuration.text.isEmpty ? nil : configuration.text

        switch (iconImage, text) {
        case (let image?, nil):
            self.init(
                theme: configuration.theme.value,
                intent: configuration.intent,
                variant: configuration.variant,
                iconImage: image
            )

        case (let image?, let text?):
            if configuration.isAttributedText {
                self.init(
                    theme: configuration.theme.value,
                    intent: configuration.intent,
                    variant: configuration.variant,
                    iconImage: image,
                    attributedText: text.demoNSAttributedString
                )
            } else {
                self.init(
                    theme: configuration.theme.value,
                    intent: configuration.intent,
                    variant: configuration.variant,
                    iconImage: image,
                    text: text
                )
            }

        case (nil, let text?):
            if configuration.isAttributedText {
                self.init(
                    theme: configuration.theme.value,
                    intent: configuration.intent,
                    variant: configuration.variant,
                    attributedText: text.demoNSAttributedString
                )
            } else {
                self.init(
                    theme: configuration.theme.value,
                    intent: configuration.intent,
                    variant: configuration.variant,
                    text: text
                )
            }

        case (nil, nil):
            self.init(
                theme: configuration.theme.value,
                intent: configuration.intent,
                variant: configuration.variant,
                text: "Tag required at least icon or text"
            )
        }
    }

    // MARK: - Setter

    func demoIcon(_ configuration: TagComponentUIViewMaker.Configuration) {
        self.iconImage = .init(icon: configuration.icon)
    }

    func demoText(_ configuration: TagComponentUIViewMaker.Configuration) {
        let text = configuration.text
        if text.isEmpty {
            self.text = nil
        } else if configuration.isAttributedText {
            self.attributedText = text.demoNSAttributedString
        } else {
            self.text = text
        }
    }
}

