//
//  IconConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct IconConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = IconConfiguration
    typealias ComponentUIView = SparkUIIcon

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
                    IconImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.icon
                )

                EnumConfigurationItemView(
                    name: "intent",
                    values: IconDemoIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                if self.configuration.wrappedValue.intent == .custom {
                    ColorTokensConfigurationItemView(
                        selectedValue: self.configuration.intentCustomColorToken
                    )
                }

                EnumConfigurationItemView(
                    name: "size",
                    values: IconDemoSize.allCases,
                    selectedValue: self.configuration.size
                )

                if self.configuration.wrappedValue.size == .custom {
                    StepperConfigurationItemView(
                        name: "Custom size",
                        value: self.configuration.sizeCustomValue,
                        bounds: 0...100,
                        step: 10
                    )
                }
            }
        )
    }
}
