//
//  RadioButtonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct RadioButtonConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = RadioButtonConfiguration
    typealias ComponentUIView = UIView // TODO: should be RadioButtonUIView<>

    // MARK: - Properties

    var configuration: Binding<Configuration>
    var componentImplementationViewRepresentable: ComponentImplementationRepresentable? = nil

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
                    RadioButtonImplementationView(configuration: self.configuration)
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
            values: RadioButtonIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "label alignment",
            values: RadioButtonLabelAlignment.allCases,
            selectedValue: self.configuration.labelAlignment
        )

        EnumConfigurationItemView(
            name: "group layout",
            values: RadioButtonGroupLayout.allCases,
            selectedValue: self.configuration.groupLayout
        )
    }

    @ViewBuilder
    private func otherSectionItemsView() -> some View {
        Section("Items") {
            StepperConfigurationItemView(
                name: "no. of items",
                value: self.configuration.numberOfItems,
                bounds: 2...5
            )

            ForEach(self.configuration.items, id: \.id) { item in
                TextFieldConfigurationItemView(
                    name: "Item \(item.id) text",
                    text: item.text
                )
            }
        }
    }
}
