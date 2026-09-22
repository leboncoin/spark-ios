//
//  StepperConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 25/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct StepperConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = StepperConfiguration
    typealias ComponentUIView = SparkUIStepper

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
                    StepperImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: { self.itemsView() },
            otherAccessibilityItemsView: { self.otherAccessibilityItemsView() }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        OptionalEnumConfigurationItemView(
            name: "format",
            values: StepperFormat.allCases,
            selectedValue: self.configuration.format
        )

        if self.framework.isUIKit {
            ToggleConfigurationItemView(
                name: "is auto repeat",
                isOn: self.configuration.uiKitIsAutoRepeat
            )

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

        if self.framework.isUIKit {
            EnumConfigurationItemView(
                name: "value changed type",
                values: StepperValueChangedType.allCases,
                selectedValue: self.configuration.uiKitValueChangedType
            )
        }
    }

    @ViewBuilder
    private func otherAccessibilityItemsView() -> some View {
        TextFieldConfigurationItemView(
            name: "context accessibility label",
            text: self.configuration.contextAccessibilityLabel,
            orientation: .vertical
        )

        TextFieldConfigurationItemView(
            name: "decrement accessibility label",
            text: self.configuration.decrementAccessibilityLabel,
            orientation: .vertical
        )

        TextFieldConfigurationItemView(
            name: "increment accessibility label",
            text: self.configuration.incrementAccessibilityLabel,
            orientation: .vertical
        )
    }
}
