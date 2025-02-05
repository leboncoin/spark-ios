//
//  TagComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias TagComponentUIViewController = ComponentDisplayViewControllerRepresentable<TagConfiguration, TagUIView, TagComponentUIViewMaker>

// MARK: - View Maker

class TagComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = TagConfiguration
    typealias ComponentView = TagUIView
    typealias ConfigurationView = TagConfigurationView
    typealias ComponentImplementationView = ComponentImplementationUIView<ComponentView, Configuration>

    // MARK: - Name

    static var fullWidth: Bool {
        false
    }

    // MARK: - Methods

    static func createComponentView(from configuration: Configuration) -> ComponentView {
        // TODO: manage all case
        return .init(
            theme: configuration.theme.value,
            intent: configuration.intent,
            variant: configuration.variant,
            text: configuration.text
        )
    }

    static func updateComponentView(_ componentView: ComponentView, from configuration: Configuration) {
        // TODO: add other parameters
        componentView.intent = configuration.intent
    }

    // TODO: voir pour mettre un nouvelle init dans le ConfigurationViewable car le code sera le même pour tous les composent UIKit
    static func createConfigurationView(from configuration: Binding<Configuration>, componentImplementationRepresentable: ComponentImplementationUIViewRepresentable<ComponentView, Configuration>) -> ConfigurationView {
        ConfigurationView(
            configuration: configuration,
            uiKitComponentImplementationView: componentImplementationRepresentable
        )
    }
}
