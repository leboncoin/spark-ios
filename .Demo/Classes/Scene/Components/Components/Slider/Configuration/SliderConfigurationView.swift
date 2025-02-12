//
//  SliderConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct SliderConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<SliderConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: SliderImplementationView.self,
            mainItemsView: {
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
        )
    }
}
