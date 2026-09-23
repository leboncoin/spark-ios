//
//  FormFieldConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct FormFieldConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = FormFieldConfiguration
    typealias ComponentUIView = FormFieldDynamicUIView

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
                    FormFieldImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                self.itemsView()
            },
            otherAccessibilityItemsView: {
                self.otherAccessibilityItemsView()
            }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "feedback state",
            values: FormFieldFeedbackState.allCases,
            selectedValue: self.configuration.feedbackState
        )

        TextFieldConfigurationItemView(
            name: "title",
            text: self.configuration.title
        )

        ToggleConfigurationItemView(
            name: "is required",
            isOn: self.configuration.isRequired
        )

        if self.framework.isSwiftUI {
            TextFieldConfigurationItemView(
                name: "clear button title",
                text: self.configuration.clearButtonTitle
            )
        }

        OptionalEnumConfigurationItemView(
            name: "clear button icon",
            values: Iconography.allCases,
            selectedValue: self.configuration.clearButtonIcon
        )

        TextFieldConfigurationItemView(
            name: "helper",
            text: self.configuration.helper
        )

        OptionalEnumConfigurationItemView(
            name: "helper icon",
            values: Iconography.allCases,
            selectedValue: self.configuration.helperIcon
        )

        if self.framework.isSwiftUI {
            EnumConfigurationItemView(
                name: "component type",
                values: FormFieldComponentType.allCases,
                selectedValue: self.configuration.componentType
            )
        }
    }

    @ViewBuilder
    private func otherAccessibilityItemsView() -> some View {
        TextFieldConfigurationItemView(
            name: "title accessibility label",
            text: self.configuration.titleAccessibilityLabel,
            orientation: .vertical
        )

        TextFieldConfigurationItemView(
            name: "clear button accessibility label",
            text: self.configuration.clearButtonAccessibilityLabel,
            orientation: .vertical
        )

        TextFieldConfigurationItemView(
            name: "helper accessibility label",
            text: self.configuration.helperAccessibilityLabel,
            orientation: .vertical
        )

        TextFieldConfigurationItemView(
            name: "secondary helper accessibility label",
            text: self.configuration.secondaryHelperAccessibilityLabel,
            orientation: .vertical
        )

        TextFieldConfigurationItemView(
            name: "secondary helper accessibility value",
            text: self.configuration.secondaryHelperAccessibilityValue,
            orientation: .vertical
        )
    }
}
