//
//  SnackbarPresentationConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct SnackbarPresentationConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = SnackbarPresentationConfiguration
    typealias ComponentUIView = UIButton

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
                    SnackbarPresentationImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: { self.itemsView() }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "direction",
            values: SnackbarPresentationDirection.allCases,
            selectedValue: self.configuration.direction
        )

        OptionalEnumConfigurationItemView(
            name: "auto dismiss delay",
            values: SnackbarAutoDismissDelay.allCases,
            selectedValue: self.configuration.autoDismissDelay
        )

        HStack {
            TextFieldConfigurationItemView(
                name: "inset",
                placeholder: "left",
                text: self.configuration.leftInsetString
            )

            VStack {
                TextField(
                    name: "top",
                    text: self.configuration.topInsetString,
                    keyboardType: .numberPad
                )

                TextField(
                    name: "bottom",
                    text: self.configuration.bottomInsetString,
                    keyboardType: .numberPad
                )
            }

            TextField(
                name: "right",
                text: self.configuration.rightInsetString,
                keyboardType: .numberPad
            )
        }
    }
}
