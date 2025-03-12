//
//  TabConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct TabConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = TabConfiguration
    typealias ComponentUIView = TabUIView

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
                    TabImplementationView(configuration: self.configuration)
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
            values: TabIntent.allCases,
            selectedValue: self.configuration.intent
        )

        HStack(spacing: .medium) {
            EnumConfigurationItemView(
                name: "size",
                values: TabSize.allCases,
                selectedValue: self.configuration.tabSize
            )

            ToggleConfigurationItemView(
                name: "is equal size",
                isOn: self.configuration.isEqualSize
            )
        }
    }

    @ViewBuilder
    private func otherSectionItemsView() -> some View {
        Section("Tabs") {
            StepperConfigurationItemView(
                name: "no. of tabs",
                value: self.configuration.numberOfTabs,
                bounds: 2...10
            )
        }

        ForEach(self.configuration.items, id: \.id) { item in
            Section("Tab \(item.id)") {
                TextFieldConfigurationItemView(
                    name: "text",
                    text: item.text
                )

                OptionalEnumConfigurationItemView(
                    name: "icon",
                    values: Iconography.allCases,
                    selectedValue: item.icon
                )

                ToggleConfigurationItemView(
                    name: "is badge",
                    isOn: item.isBadge
                )

                ToggleConfigurationItemView(
                    name: "is enabled",
                    isOn: item.isEnabled
                )
            }
        }
    }
}
