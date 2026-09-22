//
//  ComponentViewable.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - Implementation

struct ComponentViewable<
    Configuration: ComponentConfiguration,
    ComponentView: ComponentImplementationViewable<Configuration>,
    ConfigurationView: ConfigurationViewable<Configuration>,
    ExtraTools: ComponentExtraTools
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
            extraTools: ExtraTools(),
            componentView: { $configuration in
                ComponentView(configuration: $configuration)
            },
            configurationView: { $configuration in
                ConfigurationView(configuration: $configuration)
            }
        )
    }
}
