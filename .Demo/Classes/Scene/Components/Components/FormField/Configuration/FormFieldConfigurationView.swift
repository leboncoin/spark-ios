//
//  FormFieldConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct FormFieldConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<FormFieldConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: FormFieldImplementationView.self,
            mainItemsView: {
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
                    name: "is title required title",
                    isOn: self.configuration.isTitleRequired
                )

                TextFieldConfigurationItemView(
                    name: "helper",
                    text: self.configuration.helper
                )

                ToggleConfigurationItemView(
                    name: "is attributed string",
                    isOn: self.configuration.isAttributedString
                )
                EnumConfigurationItemView(
                    name: "component type",
                    values: FormFieldComponentType.allCases,
                    selectedValue: self.configuration.componentType
                )
            },
            otherAccessibilityItemsView: {
                TextFieldConfigurationItemView(
                    name: "title accessibility label",
                    text: self.configuration.titleAccessibilityLabel,
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
        )
    }
}
