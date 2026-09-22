//
//  CardConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 02/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct CardConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = CardConfiguration
    typealias ComponentUIView = SparkUICard

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
                    CardImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                self.itemsView()
            },
            otherSectionItemsView: {
                if self.framework.isSwiftUI {
                    self.headerItemsView()
                }
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

        EnumConfigurationItemView(
            name: "variant",
            values: CardVariant.allCases,
            selectedValue: self.configuration.variant
        )

        ToggleConfigurationItemView(
            name: "is highlighted",
            isOn: self.configuration.isHighlighted
        )

        if framework.isSwiftUI {
            EnumConfigurationItemView(
                name: "padding",
                values: CardPadding.allCases,
                selectedValue: self.configuration.swiftUIPadding
            )
        } else {
            ToggleConfigurationItemView(
                name: "is padding",
                isOn: self.configuration.uiKitIsPadding
            )
        }

        if self.framework.isSwiftUI {
            ToggleConfigurationItemView(
                name: "with action",
                isOn: self.configuration.swiftUIWithAction
            )
        }
    }

    @ViewBuilder
    private func headerItemsView() -> some View {
        EnumConfigurationItemView(
            name: "position",
            values: CardHeaderPosition.allCases,
            selectedValue: self.configuration.swiftUIHeaderPosition
        )

        TextFieldConfigurationItemView(
            name: "header",
            text: self.configuration.swiftUIHeader
        )

        if self.framework.isSwiftUI {

            ToggleConfigurationItemView(
                name: "is custom header content",
                isOn: self.configuration.swiftUIHeaderIsCustomContent
            )

            if self.configuration.wrappedValue.swiftUIHeaderIsCustomContent {
                TextFieldConfigurationItemView(
                    name: "second header",
                    text: self.configuration.swiftUIHeaderSecondText
                )
            }

        } else {
            ToggleConfigurationItemView(
                name: "is attributed text",
                isOn: self.configuration.uiKitIsAttributedHeader
            )
        }
    }
}
