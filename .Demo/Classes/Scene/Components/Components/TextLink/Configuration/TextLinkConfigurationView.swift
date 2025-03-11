//
//  TextLinkConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct TextLinkConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = TextLinkConfiguration
    typealias ComponentUIView = TextLinkUIView

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
                    TextLinkImplementationView(configuration: self.configuration)
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
            values: TextLinkIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "variant",
            values: TextLinkVariant.allCases,
            selectedValue: self.configuration.variant
        )

        EnumConfigurationItemView(
            name: "typography",
            values: TextLinkTypography.allCases,
            selectedValue: self.configuration.typography
        )

        OptionalEnumConfigurationItemView(
            name: "icon",
            values: Iconography.allCases,
            selectedValue: self.configuration.icon
        )

        ToggleConfigurationItemView(
            name: "is long text",
            isOn: self.configuration.isLongText
        )

        if !self.configuration.wrappedValue.isLongText {
            TextFieldConfigurationItemView(
                name: "text",
                text: self.configuration.text
            )
        }

        EnumConfigurationItemView(
            name: "alignment (content)",
            values: TextLinkAlignment.allCases,
            selectedValue: self.configuration.alignment
        )

        if self.framework.isUIKit {
            EnumConfigurationItemView(
                name: "alignment (text)",
                values: NSTextAlignment.allCases,
                selectedValue: self.configuration.uiKitTextAlignment
            )
        } else {
            EnumConfigurationItemView(
                name: "alignment (text)",
                values: TextAlignment.allCases,
                selectedValue: self.configuration.swiftUITextAlignment
            )
        }

        StepperConfigurationItemView(
            name: "number of line",
            value: self.configuration.numberOfLine,
            bounds: 0...10,
            step: 1
        )

        if self.framework.isUIKit {
            EnumConfigurationItemView(
                name: "line break mode",
                values: NSLineBreakMode.allCases,
                selectedValue: self.configuration.uiKitLineBreakMode
            )
        }
    }
}
