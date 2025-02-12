//
//  SnackbarConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct SnackbarConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<SnackbarConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: SnackbarImplementationView.self,
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: SnackbarIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                OptionalEnumConfigurationItemView(
                    name: "type",
                    values: SnackbarType.allCases,
                    selectedValue: self.configuration.type
                )

                OptionalEnumConfigurationItemView(
                    name: "variant",
                    values: SnackbarVariant.allCases,
                    selectedValue: self.configuration.variant
                )

                OptionalEnumConfigurationItemView(
                    name: "icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.icon
                )

                TextFieldConfigurationItemView(
                    name: "text",
                    text: self.configuration.text
                )

                TextFieldConfigurationItemView(
                    name: "button",
                    text: self.configuration.buttonTitle
                )

                StepperConfigurationItemView(
                    name: "max no. of lines",
                    value: self.configuration.maxNumberOfLines,
                    bounds: 0...100
                )
            }
        )
    }
}
