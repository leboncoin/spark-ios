//
//  CircularMeterConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct CircularMeterConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = CircularMeterConfiguration
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
                    CircularMeterImplementationView(configuration: self.configuration)
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
            values: CircularMeterIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "size",
            values: CircularMeterSize.allCases,
            selectedValue: self.configuration.size
        )

        SliderConfigurationItemView(
            name: "value",
            selectedValue: self.configuration.value,
            range: 0.0...1.0,
            step: 0.01
        )

        EnumConfigurationItemView(
            name: "display type",
            values: CircularMeterDisplayType.allCases,
            selectedValue: self.configuration.displayType
        )

        ToggleConfigurationItemView(
            name: "is custom content",
            isOn: self.configuration.isCustomContent
        )

        if self.configuration.wrappedValue.displayType == .text {
            TextFieldConfigurationItemView(
                name: "value text",
                text: self.configuration.valueText
            )

            if self.configuration.wrappedValue.isCustomContent {
                TextFieldConfigurationItemView(
                    name: "second value",
                    text: self.configuration.valueSecondText
                )
            }
        }

        if self.configuration.wrappedValue.displayType == .icon {
            EnumConfigurationItemView(
                name: "icon",
                values: Iconography.allCases,
                selectedValue: self.configuration.icon
            )
        }

        if self.configuration.wrappedValue.displayType.isContent {
            TextFieldConfigurationItemView(
                name: "content text",
                text: self.configuration.contentText
            )

            if self.configuration.wrappedValue.isCustomContent {
                TextFieldConfigurationItemView(
                    name: "second content",
                    text: self.configuration.contentSecondText
                )
            }
        }
    }
}
