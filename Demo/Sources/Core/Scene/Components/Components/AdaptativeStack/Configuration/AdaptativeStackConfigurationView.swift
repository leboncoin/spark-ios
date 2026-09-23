//
//  AdaptativeStackConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct AdaptativeStackConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = AdaptativeStackConfiguration
    typealias ComponentUIView = AdaptativeStackUIView

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
                    AdaptativeStackImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: { self.itemsView() }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        TextFieldConfigurationItemView(
            name: "text 1",
            text: self.configuration.text1
        )

        TextFieldConfigurationItemView(
            name: "text 2",
            text: self.configuration.text2
        )

        TextFieldConfigurationItemView(
            name: "text 3",
            text: self.configuration.text3
        )

        EnumConfigurationItemView(
            name: "axis",
            values: AdaptiveStackAxis.allCases,
            selectedValue: self.configuration.axis
        )

        EnumConfigurationItemView(
            name: "accessibility axis",
            values: AdaptiveStackAxis.allCases,
            selectedValue: self.configuration.accessibilityAxis
        )

        EnumConfigurationItemView(
            name: "alignment",
            values: AdaptiveStackAlignment.allCases,
            selectedValue: self.configuration.alignment
        )

        EnumConfigurationItemView(
            name: "accessibility alignment",
            values: AdaptiveStackAlignment.allCases,
            selectedValue: self.configuration.accessibilityAlignment
        )

        StepperConfigurationItemView(
            name: "spacing",
            value: self.configuration.spacing,
            bounds: 0...30,
            step: 5
        )

        StepperConfigurationItemView(
            name: "accessibility spacing",
            value: self.configuration.accessibilitySpacing,
            bounds: 0...100,
            step: 10
        )
    }
}
