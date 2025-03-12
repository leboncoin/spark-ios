//
//  BadgeConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct BadgeConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = BadgeConfiguration
    typealias ComponentUIView = BadgeUIView

    // MARK: - Properties

    var configuration: Binding<Configuration>
    var componentImplementationViewRepresentable: ComponentImplementationRepresentable?

    // MARK: - Initialization

    init(configuration: Binding<Configuration>) {
        self.configuration = configuration
    }

    init(
        configuration: Binding<Configuration>,
        componentImplementationViewRepresentable: ComponentImplementationRepresentable
    ) {
        self.configuration = configuration
        self.componentImplementationViewRepresentable = componentImplementationViewRepresentable
    }

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            framework: self.framework,
            componentView: {
                if let componentImplementationViewRepresentable {
                    componentImplementationViewRepresentable
                } else {
                    BadgeImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                self.itemsView()
            }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
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
}
