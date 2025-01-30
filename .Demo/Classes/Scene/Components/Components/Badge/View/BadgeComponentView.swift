//
//  BadgeComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias BadgeComponentView = ComponentViewable<BadgeConfiguration, BadgeImplementationView, BadgeConfigurationView>

// MARK: - Subview

struct BadgeImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<BadgeConfiguration>

    // MARK: - View

    var body: some View {
        BadgeView(
            theme: self.configurationWrapped.theme.value,
            intent: self.configurationWrapped.intent,
            value: Int(self.configurationWrapped.value)
        )
        .size(self.configurationWrapped.size)
        .format(self.configurationWrapped.format.sparkValue(
            customText: self.configurationWrapped.customText,
            overflowValue: self.configurationWrapped.overflowValue
        ))
        .borderVisible(self.configurationWrapped.isBorderVisible)
        .demoAccessibilityLabel(self.configurationWrapped)
    }
}

struct BadgeConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<BadgeConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: BadgeImplementationView.self,
            itemsView: {
                EnumConfigurationView(
                    name: "intent",
                    values: BadgeIntentType.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationView(
                    name: "size",
                    values: BadgeSize.allCases,
                    selectedValue: self.configuration.size
                )

                EnumConfigurationView(
                    name: "format",
                    values: BadgeFormat.allCases,
                    selectedValue: self.configuration.format
                )

                switch self.configuration.wrappedValue.format {
                case .custom:
                    TextFieldConfigurationView(
                        name: "custom text",
                        text: self.configuration.customText
                    )

                case .overflowCounter:
                    StepperConfigurationView(
                        name: "overflow value",
                        value: self.configuration.overflowValue,
                        bounds: 1...200,
                        step: 5
                    )

                default:
                    EmptyView()
                }

                StepperConfigurationView(
                    name: "value",
                    value: self.configuration.value,
                    bounds: 1...200,
                    step: 5
                )

                ToggleConfigurationView(
                    name: "is border visible",
                    isOn: self.configuration.isBorderVisible
                )
            }
        )
    }
}

// MARK: - Preview

struct BadgeComponentView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeComponentView()
    }
}
