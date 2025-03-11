//
//  CheckboxGroupConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct CheckboxGroupConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = CheckboxGroupConfiguration
    typealias ComponentUIView = CheckboxGroupUIView

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
                    CheckboxGroupImplementationView(configuration: self.configuration)
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
            values: CheckboxIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "alignment",
            values: CheckboxAlignment.allCases,
            selectedValue: self.configuration.alignment
        )

        EnumConfigurationItemView(
            name: "layout",
            values: CheckboxGroupLayout.allCases,
            selectedValue: self.configuration.layout
        )

        TextFieldConfigurationItemView(
            name: "title",
            text: self.configuration.title
        )

        EnumConfigurationItemView(
            name: "checked icon",
            values: Iconography.allCases,
            selectedValue: self.configuration.checkedIcon
        )
    }

    @ViewBuilder
    private func otherSectionItemsView() -> some View {
        Section("Items") {
            StepperConfigurationItemView(
                name: "no. of items",
                value: self.configuration.numberOfItems,
                bounds: 2...4
            )
        }

        ForEach(self.configuration.items, id: \.id) { item in
            Section("Item \(item.id)") {
                ToggleConfigurationItemView(
                    name: "is long text",
                    isOn: item.isLongText
                )

                if self.framework.isUIKit {
                    ToggleConfigurationItemView(
                        name: "is attributed text",
                        isOn: item.isAttributedText
                    )
                }

                ToggleConfigurationItemView(
                    name: "is enabled",
                    isOn: item.isEnabled
                )
            }
        }
    }
}
