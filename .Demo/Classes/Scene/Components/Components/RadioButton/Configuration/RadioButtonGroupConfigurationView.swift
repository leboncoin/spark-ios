//
//  RadioButtonGroupConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct RadioButtonGroupConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = RadioButtonGroupConfiguration
    typealias ComponentUIView = RadioButtonIntUIGroupView

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
                    RadioButtonGroupImplementationView(configuration: self.configuration)
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

            if self.framework.isUIKit {
                StepperConfigurationItemView(
                    name: "selected ID",
                    value: self.configuration.uiKitSelectedId,
                    bounds: -1...self.configuration.wrappedValue.numberOfItems
                )
            }
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
            }
        }
    }
}
