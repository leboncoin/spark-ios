//
//  SliderConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct SliderConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = SliderConfiguration
    typealias ComponentUIView = SliderFloatUIView

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
                    SliderImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: { self.itemsView() }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "intent",
            values: SliderIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "shape",
            values: SliderShape.allCases,
            selectedValue: self.configuration.shape
        )

        if self.framework.isUIKit {
            ToggleConfigurationItemView(
                name: "is continuous",
                isOn: self.configuration.uiKitIsContinuous
            )
        }

        TextFieldConfigurationItemView(
            name: "value",
            text: self.configuration.valueString,
            keyboardType: .numberPad
        )

        TextFieldConfigurationItemView(
            name: "step",
            text: self.configuration.stepString,
            keyboardType: .numberPad
        )

        HStack {
            TextFieldConfigurationItemView(
                name: "bounds",
                placeholder: "min",
                text: self.configuration.lowerBoundString,
                keyboardType: .numberPad
            )

            TextField(
                name: "max",
                text: self.configuration.upperBoundString,
                keyboardType: .numberPad
            )
        }
    }
}
