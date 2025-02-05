//
//  ComponentUIViewMaker.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI

protocol ComponentUIViewMaker<ComponentView, Configuration> {
    associatedtype Configuration: ComponentConfiguration
    associatedtype ComponentView: UIView
    associatedtype ConfigurationView: ConfigurationViewable

    static var fullWidth: Bool { get }

    static func createComponentView(from configuration: Configuration) -> ComponentView
    static func updateComponentView(_ componentView: ComponentView, from configuration: Configuration)

    static func createConfigurationView(from configuration: Binding<Configuration>, componentImplementationRepresentable: ComponentImplementationUIViewRepresentable<ComponentView, Configuration>) -> ConfigurationView
}
