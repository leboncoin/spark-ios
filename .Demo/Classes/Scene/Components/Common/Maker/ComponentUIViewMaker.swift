//
//  ComponentUIViewMaker.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI

/// Used by UIKit components only
protocol ComponentUIViewMaker<Configuration, ComponentView, ConfigurationView> {

    // MARK: - Type Alias

    associatedtype Configuration: ComponentConfiguration
    associatedtype ComponentView: UIView
    associatedtype ConfigurationView: ConfigurationUIViewable<Configuration, ComponentView>

    // MARK: - Static Properties

    static var fullWidth: Bool { get }

    // MARK: - Static Methods

    static func createComponentView(
        for configuration: Configuration,
        viewController: ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, Self>?
    ) -> ComponentView

    static func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration,
        viewController: ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, Self>?
    )
}

extension ComponentUIViewMaker {

    static func createComponentImplementationView(
        for configuration: Configuration,
        context: ComponentContextType,
        viewController: ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, Self>?
    ) -> ComponentImplementationUIView<ComponentView, Configuration> {
        let componentView = self.createComponentView(
            for: configuration,
            viewController: viewController
        )

        return .init(
            configuration: configuration,
            componentView: componentView,
            contextType: context,
            fullWidth: self.fullWidth
        )
    }
}
