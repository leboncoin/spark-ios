//
//  AwarenessCardConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct AwarenessCardConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = AwarenessCardConfiguration
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
                    AwarenessCardImplementationView(configuration: self.configuration)
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
            values: CardIntent.allCases,
            selectedValue: self.configuration.intent
        )

        OptionalEnumConfigurationItemView(
            name: "icon",
            values: Iconography.allCases,
            selectedValue: self.configuration.icon
        )

        ToggleConfigurationItemView(
            name: "is custom content",
            isOn: self.configuration.isCustomContent
        )

        TextFieldConfigurationItemView(
            name: "title",
            text: self.configuration.title
        )

        if self.configuration.wrappedValue.isCustomContent {

            TextFieldConfigurationItemView(
                name: "second title",
                text: self.configuration.titleSecondText
            )
        }

        TextFieldConfigurationItemView(
            name: "description",
            text: self.configuration.description
        )

        if self.configuration.wrappedValue.isCustomContent {

            TextFieldConfigurationItemView(
                name: "second description",
                text: self.configuration.descriptionSecondText
            )
        }

        OptionalEnumConfigurationItemView(
            name: "action",
            values: AwarenessCardActionType.allCases,
            selectedValue: self.configuration.action
        )
    }
}
