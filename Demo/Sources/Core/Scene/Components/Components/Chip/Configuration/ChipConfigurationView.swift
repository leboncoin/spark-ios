//
//  ChipConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ChipConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = ChipConfiguration
    typealias ComponentUIView = SparkUIChip

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
                    ChipImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                self.itemsView()
            },
            otherSectionItemsView: {
                self.extraComponentItemsView()
            }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "intent",
            values: ChipIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "variant",
            values: ChipVariant.allCases,
            selectedValue: self.configuration.variant
        )

        EnumConfigurationItemView(
            name: "alignment",
            values: ChipAlignment.allCases,
            selectedValue: self.configuration.alignment
        )

        EnumConfigurationItemView(
            name: "size",
            values: ChipSize.allCases,
            selectedValue: self.configuration.size
        )

        TextFieldConfigurationItemView(
            name: "text",
            text: self.configuration.text
        )

        if self.framework.isSwiftUI {
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

        } else {
            ToggleConfigurationItemView(
                name: "is attributed text",
                isOn: self.configuration.uiKitIsAttributedText
            )
        }

        OptionalEnumConfigurationItemView(
            name: "icon",
            values: Iconography.allCases,
            selectedValue: self.configuration.icon
        )

        if self.framework.isSwiftUI {
            ToggleConfigurationItemView(
                name: "with action",
                isOn: self.configuration.swiftUIWithAction
            )
        }

        ToggleConfigurationItemView(
            name: "is selected",
            isOn: self.configuration.isSelected
        )
    }

    @ViewBuilder
    private func extraComponentItemsView() -> some View {
        ToggleConfigurationItemView(
            name: "with extra component (badge)",
            isOn: self.configuration.withExtraComponent
        )

        if self.configuration.wrappedValue.withExtraComponent {
            StepperConfigurationItemView(
                name: "value",
                value: self.configuration.badgeConfiguration.value,
                bounds: 1...100,
                step: 10
            )

            TextFieldConfigurationItemView(
                name: "accessibility label",
                text: self.configuration.badgeConfiguration.accessibilityLabel.value
            )
        }
    }
}
