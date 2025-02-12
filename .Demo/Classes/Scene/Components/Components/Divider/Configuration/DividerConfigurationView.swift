//
//  DividerConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct DividerConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<DividerConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: DividerImplementationView.self,
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: DividerIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationItemView(
                    name: "axis",
                    values: DividerAxis.allCases,
                    selectedValue: self.configuration.axis
                )

                EnumConfigurationItemView(
                    name: "alignment",
                    values: DividerAlignment.allCases,
                    selectedValue: self.configuration.alignment
                )

                TextFieldConfigurationItemView(
                    name: "text",
                    text: self.configuration.text
                )
            }
        )
    }
}
