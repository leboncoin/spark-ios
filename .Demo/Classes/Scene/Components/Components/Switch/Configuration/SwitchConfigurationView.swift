//
//  SwitchConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct SwitchConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = SwitchConfiguration
    typealias ComponentUIView = SwitchUIView

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
                    SwitchImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: { self.itemsView() }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "intent",
            values: SwitchIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "alignment",
            values: SwitchAlignment.allCases,
            selectedValue: self.configuration.alignment
        )

        TextFieldConfigurationItemView(
            name: "text",
            text: self.configuration.text
        )

        ToggleConfigurationItemView(
            name: "is attributed text",
            isOn: self.configuration.isAttributedText
        )

        ToggleConfigurationItemView(
            name: "has images",
            isOn: self.configuration.hasImages
        )

        if self.framework.isUIKit {
            ToggleConfigurationItemView(
                name: "is on",
                isOn: self.configuration.uiKitIsOn
            )

            ToggleConfigurationItemView(
                name: "is animated",
                isOn: self.configuration.uiKitIsAnimated
            )

            ToggleConfigurationItemView(
                name: "is enabled animated",
                isOn: self.configuration.uiKitIsEnabledAnimated
            )
        }
    }
}
