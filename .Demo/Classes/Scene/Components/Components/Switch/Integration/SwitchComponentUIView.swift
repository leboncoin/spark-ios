//
//  SwitchComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SwitchComponentUIViewController = ComponentDisplayViewControllerRepresentable<SwitchConfiguration, SwitchUIView, SwitchConfigurationView, SwitchComponentUIViewMaker>

extension SwitchComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class SwitchComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SwitchConfiguration
    typealias ComponentView = SwitchUIView
    typealias ConfigurationView = SwitchConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SwitchComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        return .init(configuration: configuration)
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value
        componentView.intent = configuration.intent
        componentView.alignment = configuration.alignment
        componentView.images = .init(configuration: configuration)
        componentView.demoIsOn(configuration)
        componentView.demoIsEnabled(configuration)
        componentView.demoText(configuration)
        componentView.demoAccessibilityLabel(configuration)
        componentView.demoBackground(configuration)
    }
}

// MARK: - Extension

private extension SwitchUIView {

    // MARK: - Initialization

    convenience init(configuration: SwitchComponentUIViewMaker.Configuration) {
        let isText = !configuration.text.isEmpty
        let isAttributedText = configuration.isAttributedText
        let images = SwitchUIImages.init(configuration: configuration)

        switch (isText, isAttributedText, images) {
        case (true, false, let images?): // Text + Images
            self.init(
                theme: configuration.theme.value,
                isOn: configuration.uiKitIsOn,
                alignment: configuration.alignment,
                intent: configuration.intent,
                isEnabled: configuration.isEnabled.value,
                images: images,
                text: configuration.text
            )

        case (false, false, let images?): // Only Images
            self.init(
                theme: configuration.theme.value,
                isOn: configuration.uiKitIsOn,
                alignment: configuration.alignment,
                intent: configuration.intent,
                isEnabled: configuration.isEnabled.value,
                images: images
            )

        case (true, false, nil): // Only Text
            self.init(
                theme: configuration.theme.value,
                isOn: configuration.uiKitIsOn,
                alignment: configuration.alignment,
                intent: configuration.intent,
                isEnabled: configuration.isEnabled.value,
                text: configuration.text
            )

        case (true, true, let images?): // Attributed Text + Images
            self.init(
                theme: configuration.theme.value,
                isOn: configuration.uiKitIsOn,
                alignment: configuration.alignment,
                intent: configuration.intent,
                isEnabled: configuration.isEnabled.value,
                images: images,
                attributedText: configuration.text.demoNSAttributedString
            )

        case (true, true, nil): // Only Attributed Text
            self.init(
                theme: configuration.theme.value,
                isOn: configuration.uiKitIsOn,
                alignment: configuration.alignment,
                intent: configuration.intent,
                isEnabled: configuration.isEnabled.value,
                attributedText: configuration.text.demoNSAttributedString
            )

        default: // No Text and Images
            self.init(
                theme: configuration.theme.value,
                isOn: configuration.uiKitIsOn,
                alignment: configuration.alignment,
                intent: configuration.intent,
                isEnabled: configuration.isEnabled.value
            )
        }
    }

    // MARK: - Methods

    func demoText(_ configuration: SwitchComponentUIViewMaker.Configuration) {
        let isText = !configuration.text.isEmpty
        let isAttributedText = configuration.isAttributedText

        switch (isText, isAttributedText) {
        case (true, false): // Text
            self.text = configuration.text

        case (true, true): // Attributed Text
            self.attributedText = configuration.text.demoNSAttributedString

        default: // No Text
            self.text = nil
            self.attributedText = nil
        }
    }

    func demoIsOn(_ configuration: SwitchComponentUIViewMaker.Configuration) {
        if configuration.uiKitIsAnimated {
            self.setOn(configuration.uiKitIsOn, animated: true)
        } else {
            self.isOn = configuration.uiKitIsOn
        }
    }

    func demoIsEnabled(_ configuration: SwitchComponentUIViewMaker.Configuration) {
        if configuration.uiKitIsEnabledAnimated {
            self.setEnabled(configuration.isEnabled.value, animated: true)
        } else {
            self.isEnabled = configuration.isEnabled.value
        }
    }
}

private extension SwitchUIImages {

    init?(configuration: SwitchComponentUIViewMaker.Configuration) {
        if configuration.hasImages {
            self.init(
                on: .init(icon: Iconography.check),
                off: .init(icon: Iconography.cross)
            )
        } else {
            return nil
        }
    }
}
