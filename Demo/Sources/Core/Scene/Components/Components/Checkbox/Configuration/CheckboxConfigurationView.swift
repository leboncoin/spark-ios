//
//  CheckboxConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct CheckboxConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = CheckboxConfiguration
    typealias ComponentUIView = SparkUICheckbox

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
                    CheckboxImplementationView(configuration: self.configuration)
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
            values: CheckboxIntent.allCases,
            selectedValue: self.configuration.intent
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

        if self.framework.isUIKit {
            ToggleConfigurationItemView(
                name: "use selection state",
                isOn: self.configuration.uiKitUseSelectionState
            )

            if self.configuration.wrappedValue.uiKitUseSelectionState {
                EnumConfigurationItemView(
                    name: "selection state",
                    values: CheckboxSelectionState.allCases,
                    selectedValue: self.configuration.uiKitSelectionState
                )
            }
        }

        if self.framework.isUIKit {
            ToggleConfigurationItemView(
                name: "is animated",
                isOn: self.configuration.uiKitIsAnimated
            )
        }
    }
}
