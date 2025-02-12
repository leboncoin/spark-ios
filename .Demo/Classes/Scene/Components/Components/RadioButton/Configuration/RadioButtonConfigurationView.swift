//
//  RadioButtonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct RadioButtonConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<RadioButtonConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: RadioButtonImplementationView.self,
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: RadioButtonIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationItemView(
                    name: "label alignment",
                    values: RadioButtonLabelAlignment.allCases,
                    selectedValue: self.configuration.labelAlignment
                )

                EnumConfigurationItemView(
                    name: "group layout",
                    values: RadioButtonGroupLayout.allCases,
                    selectedValue: self.configuration.groupLayout
                )
            },
            otherSectionItemsView: {
                Section("Items") {
                    StepperConfigurationItemView(
                        name: "no. of items",
                        value: self.configuration.numberOfItems,
                        bounds: 2...5
                    )

                    ForEach(self.configuration.items, id: \.id) { item in
                        TextFieldConfigurationItemView(
                            name: "Item \(item.id) text",
                            text: item.text
                        )
                    }
                }
            }
        )
    }
}
