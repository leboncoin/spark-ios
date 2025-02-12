//
//  BadgeConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct BadgeConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<BadgeConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: BadgeImplementationView.self,
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: BadgeIntentType.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationItemView(
                    name: "size",
                    values: BadgeSize.allCases,
                    selectedValue: self.configuration.size
                )

                EnumConfigurationItemView(
                    name: "format",
                    values: BadgeFormat.allCases,
                    selectedValue: self.configuration.format
                )

                switch self.configuration.wrappedValue.format {
                case .custom:
                    TextFieldConfigurationItemView(
                        name: "custom text",
                        text: self.configuration.customText
                    )

                case .overflowCounter:
                    StepperConfigurationItemView(
                        name: "overflow value",
                        value: self.configuration.overflowValue,
                        bounds: 1...200,
                        step: 5
                    )

                default:
                    EmptyView()
                }

                StepperConfigurationItemView(
                    name: "value",
                    value: self.configuration.value,
                    bounds: 1...200,
                    step: 5
                )

                ToggleConfigurationItemView(
                    name: "is border visible",
                    isOn: self.configuration.isBorderVisible
                )
            }
        )
    }
}
