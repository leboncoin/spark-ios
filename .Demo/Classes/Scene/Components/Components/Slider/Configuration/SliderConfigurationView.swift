//
//  SliderConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct SliderConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = SliderConfiguration
    typealias ComponentUIView = SliderFloatUIView

    // MARK: - Properties

    var configuration: Binding<Configuration>
    var componentImplementationViewRepresentable: ComponentImplementationRepresentable? = nil

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
        if let componentImplementationViewRepresentable {
            ComponentConfigurationView(
                configuration: self.configuration,
                componentView: componentImplementationViewRepresentable,
                mainItemsView: { self.itemsView() }
            )
        } else {
            ComponentConfigurationView(
                configuration: self.configuration,
                componentViewType: SliderImplementationView.self,
                mainItemsView: { self.itemsView() }
            )
        }
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
