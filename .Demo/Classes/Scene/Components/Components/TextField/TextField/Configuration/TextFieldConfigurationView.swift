//
//  TextFieldConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct TextFieldConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = TextFieldConfiguration
    typealias ComponentUIView = TextFieldUIView

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
                    TextFieldImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                TextFieldCommonConfigurationView(
                    configuration: self.configuration,
                    framework: self.framework
                )
            },
            otherSectionItemsView: {
                TextFieldCommonContentSideConfigurationView(
                    configuration: self.configuration,
                    framework: self.framework
                )
            }
        )
    }
}
