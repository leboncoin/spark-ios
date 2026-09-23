//
//  PopoverConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct PopoverConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = PopoverConfiguration
    typealias ComponentUIView = UIButton

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
                    PopoverImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: PopoverIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                TextFieldConfigurationItemView(
                    name: "text",
                    text: self.configuration.text
                )

                if self.framework.isUIKit {
                    ToggleConfigurationItemView(
                        name: "show arrow",
                        isOn: self.configuration.uiKitShowArrow
                    )
                }
            }
        )
    }
}
