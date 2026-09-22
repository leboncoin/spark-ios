//
//  TagConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct TagConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = TagConfiguration
    typealias ComponentUIView = SparkUITag

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
                    TagImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: TagIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationItemView(
                    name: "variant",
                    values: TagVariant.allCases,
                    selectedValue: self.configuration.variant
                )

                EnumConfigurationItemView(
                    name: "size",
                    values: TagSize.allCases,
                    selectedValue: self.configuration.size
                )

                ToggleConfigurationItemView(
                    name: "is highlighted",
                    isOn: self.configuration.isHighlighted
                )

                OptionalEnumConfigurationItemView(
                    name: "icon",
                    values: Iconography.allCases,
                    selectedValue: self.configuration.icon
                )

                TextFieldConfigurationItemView(
                    name: "text",
                    text: self.configuration.text
                )

                if self.framework.isUIKit {
                    ToggleConfigurationItemView(
                        name: "is attributed text",
                        isOn: self.configuration.uiKitIsAttributedText
                    )
                } else {
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
                }
            }
        )
    }
}
