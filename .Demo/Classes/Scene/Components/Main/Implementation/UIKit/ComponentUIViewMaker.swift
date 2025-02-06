//
//  ComponentUIViewMaker.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI

protocol ComponentUIViewMaker<ComponentView, Configuration, ConfigurationView> {

    // MARK: - Type Alias

    associatedtype Configuration: ComponentConfiguration
    associatedtype ComponentView: UIView
    associatedtype ConfigurationView: ConfigurationViewable

    // MARK: - Static Methods

    static func createComponentImplementationView(
        from configuration: Configuration,
        context: ComponentContextType
    ) -> ComponentImplementationUIView<ComponentView, Configuration>

    static func updateComponentView(
        _ componentView: ComponentView,
        from configuration: Configuration
    )

    static func createConfigurationView(
        from configuration: Binding<Configuration>,
        componentImplementationRepresentable: ComponentImplementationUIViewRepresentable<ComponentView, Configuration>
    ) -> ConfigurationView
}
