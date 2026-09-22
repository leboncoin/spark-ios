//
//  SnackbarConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct SnackbarConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = SnackbarConfiguration
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
                    SnackbarImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: { self.itemsView() }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "direction",
            values: SnackbarDirection.allCases,
            selectedValue: self.configuration.direction
        )

        EnumConfigurationItemView(
            name: "intent",
            values: SnackbarIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "alignment",
            values: SnackbarAlignment.allCases,
            selectedValue: self.configuration.alignment
        )

        OptionalEnumConfigurationItemView(
            name: "icon",
            values: Iconography.allCases,
            selectedValue: self.configuration.icon
        )

        if self.framework.isSwiftUI {
            ToggleConfigurationItemView(
                name: "is custom content",
                isOn: self.configuration.swiftUIIsCustomContent
            )
        }

        TextFieldConfigurationItemView(
            name: "title",
            text: self.configuration.title
        )

        if self.framework.isUIKit {
            ToggleConfigurationItemView(
                name: "is attributed title",
                isOn: self.configuration.uiKitIsAttributedTitle
            )
        } else {

            if self.configuration.wrappedValue.swiftUIIsCustomContent {
                TextFieldConfigurationItemView(
                    name: "second title text",
                    text: self.configuration.swiftUISecondTitleText
                )
            }
        }

        TextFieldConfigurationItemView(
            name: "message",
            text: self.configuration.message
        )

        if self.framework.isUIKit {
            ToggleConfigurationItemView(
                name: "is attributed message",
                isOn: self.configuration.uiKitIsAttributedMessage
            )
        } else {
            if self.configuration.wrappedValue.swiftUIIsCustomContent {
                TextFieldConfigurationItemView(
                    name: "second message text",
                    text: self.configuration.swiftUISecondMessageText
                )
            }
        }

        ToggleConfigurationItemView(
            name: "has button",
            isOn: self.configuration.hasButton
        )

        if self.configuration.wrappedValue.hasButton {
            TextFieldConfigurationItemView(
                name: "button",
                text: self.configuration.buttonTitle
            )
        }

        OptionalEnumConfigurationItemView(
            name: "auto dismiss delay",
            values: SnackbarAutoDismissDelay.allCases,
            selectedValue: self.configuration.autoDismissDelay
        )

        if self.framework.isUIKit {
            ToggleConfigurationItemView(
                name: "is animated",
                isOn: self.configuration.uiKitIsAnimated
            )
        }

        if self.framework.isSwiftUI {
            ToggleConfigurationItemView(
                name: "is completed",
                isOn: self.configuration.swiftUIIsCompleted
            )
        }
    }
}
