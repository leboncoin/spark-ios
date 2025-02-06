//
//  ConfigurationViewable.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

protocol ConfigurationViewable<Configuration>: View {

    // MARK: - Associated Type

    associatedtype Configuration: ComponentConfiguration

    // MARK: - Properties

    var configuration: Binding<Configuration> { get set }

    // MARK: - Initialization

    init(configuration: Binding<Configuration>)
}

// MARK: - For UIKit only

protocol ConfigurationUIViewable<Configuration, ComponentUIView>: View {

    // MARK: - Associated Type

    associatedtype Configuration: ComponentConfiguration
    associatedtype ComponentUIView: UIView

    // MARK: - Initialization

    init(configuration: Binding<Configuration>, uiKitComponentImplementationView: ComponentImplementationUIViewRepresentable<ComponentUIView, Configuration>)
}
