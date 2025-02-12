//
//  CheckboxConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct CheckboxConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<CheckboxConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: CheckboxImplementationView.self,
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: CheckboxIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationItemView(
                    name: "alignment",
                    values: CheckboxAlignment.allCases,
                    selectedValue: self.configuration.alignment
                )

                TextFieldConfigurationItemView(
                    name: "text",
                    text: self.configuration.text
                )

                EnumConfigurationItemView(
                    name: "checked icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.checkedIcon
                )

                ToggleConfigurationItemView(
                    name: "is indeterminate",
                    isOn: self.configuration.isIndeterminate
                )
            }
        )
    }
}
