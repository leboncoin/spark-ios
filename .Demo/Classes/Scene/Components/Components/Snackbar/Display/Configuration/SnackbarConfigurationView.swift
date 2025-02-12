//
//  SnackbarConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct SnackbarConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = SnackbarConfiguration
    typealias ComponentUIView = SnackbarUIView

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
        if let componentImplementationViewRepresentable {
            ComponentConfigurationView(
                configuration: self.configuration,
                componentView: componentImplementationViewRepresentable,
                mainItemsView: { self.itemsView() }
            )
        } else {
            ComponentConfigurationView(
                configuration: self.configuration,
                componentViewType: SnackbarImplementationView.self,
                mainItemsView: { self.itemsView() }
            )
        }
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "intent",
            values: SnackbarIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "type",
            values: SnackbarType.allCases,
            selectedValue: self.configuration.type
        )

        EnumConfigurationItemView(
            name: "variant",
            values: SnackbarVariant.allCases,
            selectedValue: self.configuration.variant
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

        StepperConfigurationItemView(
            name: "max no. of lines",
            value: self.configuration.maxNumberOfLines,
            bounds: 0...100
        )

        EnumConfigurationItemView(
            name: "content type",
            values: SnackbarContentType.allCases(for: self.framework),
            selectedValue: self.configuration.contentType
        )

        if self.configuration.wrappedValue.contentType == .button {
            TextFieldConfigurationItemView(
                name: "button",
                text: self.configuration.buttonTitle
            )
        }
    }
}
