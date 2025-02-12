//
//  ChipConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct ChipConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<ChipConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: ChipImplementationView.self,
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: ChipIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationItemView(
                    name: "variant",
                    values: ChipVariant.allCases,
                    selectedValue: self.configuration.variant
                )

                EnumConfigurationItemView(
                    name: "alignment",
                    values: ChipAlignment.allCases,
                    selectedValue: self.configuration.alignment
                )

                TextFieldConfigurationItemView(
                    name: "text",
                    text: self.configuration.text
                )

                OptionalEnumConfigurationItemView(
                    name: "icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.icon
                )

                ToggleConfigurationItemView(
                    name: "with action",
                    isOn: self.configuration.withAction
                )

                ToggleConfigurationItemView(
                    name: "with extra component (badge)",
                    isOn: self.configuration.withExtraComponent
                )

                ToggleConfigurationItemView(
                    name: "is selected",
                    isOn: self.configuration.isSelected
                )
            }
        )
    }
}
