//
//  IconButtonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct IconButtonConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = IconButtonConfiguration
    typealias ComponentUIView = IconButtonUIView

    // MARK: - Properties

    var configuration: Binding<Configuration>
    var componentImplementationViewRepresentable: ComponentImplementationRepresentable?

    // MARK: - Initialization

    init(configuration: Binding<Configuration>) {
        self.configuration = configuration
    }

    init(
        configuration: Binding<Configuration>,
        componentImplementationViewRepresentable: ComponentImplementationRepresentable
    ) {
        self.configuration = configuration
        self.componentImplementationViewRepresentable = componentImplementationViewRepresentable
    }

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            framework: self.framework,
            componentView: {
                if let componentImplementationViewRepresentable {
                    componentImplementationViewRepresentable
                } else {
                    IconButtonImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                ButtonCommonConfigurationView(
                    configuration: self.configuration,
                    isIconButton: true,
                    framework: framework
                )
            },
            otherSectionItemsView: {
                ButtonCommonOtherConfigurationView(
                    configuration: self.configuration,
                    isIconButton: true
                )
            }
        )
    }
}
