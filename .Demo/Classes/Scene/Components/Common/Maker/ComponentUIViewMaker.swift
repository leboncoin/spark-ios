//
//  ComponentUIViewMaker.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

/// Used by UIKit components only
protocol ComponentUIViewMaker<Configuration, ComponentView, ConfigurationView> {

    // MARK: - Type Alias

    associatedtype Configuration: ComponentConfiguration
    associatedtype ComponentView: UIView
    associatedtype ConfigurationView: ConfigurationUIViewable<Configuration, ComponentView>

    // MARK: - Properties

    var viewController: ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, Self>? { get set }

    // MARK: - Initialization

    init()

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    )

    // MARK: - Getter

    func isFullWidth() -> Bool
    func isInfoLabel() -> Bool
}

extension ComponentUIViewMaker {

    func isFullWidth() -> Bool {
        false
    }

    func isInfoLabel() -> Bool {
        false
    }

    func createComponentImplementationView(
        for configuration: Configuration,
        context: ComponentContextType,
        displayStyle: ComponentDisplayStyle? = nil
    ) -> ComponentImplementationUIView<ComponentView, Configuration> {
        if self.isInfoLabel() {
            configuration.uiKitInfoLabel = UILabel()
        }

        let componentView = self.createComponentView(
            for: configuration
        )

        return .init(
            configuration: configuration,
            componentView: componentView,
            contextType: context,
            displayStyle: displayStyle,
            isFullWidth: self.isFullWidth()
        )
    }
}
