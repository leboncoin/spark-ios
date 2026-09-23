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
protocol ComponentUIViewMaker<Configuration, ComponentView, ConfigurationView, ExtraTools> {

    // MARK: - Type Alias

    associatedtype Configuration: ComponentConfiguration
    associatedtype ComponentView: UIView
    associatedtype ConfigurationView: ConfigurationUIViewable<Configuration, ComponentView>
    associatedtype ExtraTools: ComponentExtraTools

    // MARK: - Properties

    var viewController: ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, Self, ExtraTools>? { get set }

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
    func isResetButton() -> Bool
}

extension ComponentUIViewMaker {

    func isFullWidth() -> Bool {
        false
    }

    func isInfoLabel() -> Bool {
        false
    }

    func isResetButton() -> Bool {
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

        if self.isResetButton() {
            let button = UIButton(configuration: .filled())
            configuration.uiKitActionButton = button
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
