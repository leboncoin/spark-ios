//
//  ComponentViewable.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - Protocols

protocol ComponentImplementationViewable<C>: View {
    associatedtype C: ComponentConfiguration
    var configuration: Binding<C> { get set }

    init(configuration: Binding<C>)
}

extension ComponentImplementationViewable {

    var configurationWrapped: C {
        self.configuration.wrappedValue
    }
}

protocol ConfigurationViewable<C>: View {
    associatedtype C: ComponentConfiguration
    var configuration: Binding<C> { get set }
    
    init(configuration: Binding<C>)
}

// MARK: - Implementation

struct ComponentViewable<
    Configuration: ComponentConfiguration,
    ComponentView: ComponentImplementationViewable<Configuration>,
    ConfigurationView: ConfigurationViewable<Configuration>
>: View {

    // MARK: - Properties

    @State private var configurations: [Configuration] = [.init()]

    private(set) var style: ComponentDisplayStyle = .default
    private(set) var styles: [ComponentDisplayStyle] = ComponentDisplayStyle.allCases

    // MARK: - View

    var body: some View {
        ComponentDisplayView(
            configurations: self.configurations,
            style: self.style,
            styles: self.styles,
            componentView: { $configuration in
                ComponentView(configuration: $configuration)
            },
            configurationView: { $configuration in
                ConfigurationView(configuration: $configuration)
            }
        )
    }
}
