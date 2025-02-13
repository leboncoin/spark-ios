//
//  CheckboxGroupConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct CheckboxGroupConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<CheckboxGroupConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: CheckboxGroupImplementationView.self,
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

                EnumConfigurationItemView(
                    name: "layout",
                    values: CheckboxGroupLayout.allCases,
                    selectedValue: self.configuration.layout
                )

                EnumConfigurationItemView(
                    name: "checked icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.checkedIcon
                )
            },
            otherSectionItemsView: {
                Section("Items") {
                    StepperConfigurationItemView(
                        name: "no. of items",
                        value: self.configuration.numberOfItems,
                        bounds: 2...4
                    )
                }

                ForEach(self.configuration.items, id: \.id) { item in
                    Section("Item \(item.id)") {
                        ToggleConfigurationItemView(
                            name: "is long text",
                            isOn: item.isLongText
                        )

                        ToggleConfigurationItemView(
                            name: "is attributed text",
                            isOn: item.isAttributedText
                        )

                        ToggleConfigurationItemView(
                            name: "is enabled",
                            isOn: item.isEnabled
                        )
                    }
                }
            }
        )
    }
}
