//
//  DividerConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct DividerConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = DividerConfiguration
    typealias ComponentUIView = SparkUIDivider

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
                    DividerImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: { self.itemsView() }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
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

        if self.framework.isUIKit {
            ToggleConfigurationItemView(
                name: "is attributed text",
                isOn: self.configuration.uiKitIsAttributedText
            )
        } else {
            ToggleConfigurationItemView(
                name: "is custom content",
                isOn: self.configuration.swiftUIIsCustomContent
            )

            if self.configuration.wrappedValue.swiftUIIsCustomContent {
                TextFieldConfigurationItemView(
                    name: "second text",
                    text: self.configuration.swiftUISecondText
                )
            }
        }
    }
}
