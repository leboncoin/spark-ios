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
    typealias ComponentUIView = UIView

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
            },
            otherSectionItemsView: {
                self.otherSectionItemsView()
            }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "intent",
            values: BadgeIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "size",
            values: BadgeSize.allCases,
            selectedValue: self.configuration.size
        )

        ToggleConfigurationItemView(
            name: "is value",
            isOn: self.configuration.isValue
        )

        if self.configuration.wrappedValue.isValue {
            StepperConfigurationItemView(
                name: "value",
                value: self.configuration.value,
                bounds: 1...110,
                step: 5
            )

            TextFieldConfigurationItemView(
                name: "unit",
                text: self.configuration.unit
            )
        }

        ToggleConfigurationItemView(
            name: "is border",
            isOn: self.configuration.isBorder
        )
    }

    @ViewBuilder
    private func otherSectionItemsView() -> some View {
        ToggleConfigurationItemView(
            name: "is attached",
            isOn: self.configuration.isAttached
        )

        if self.configuration.wrappedValue.isAttached {
            EnumConfigurationItemView(
                name: "position",
                values: BadgePosition.allCases,
                selectedValue: self.configuration.position
            )
        }
    }
}
