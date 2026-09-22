//
//  AvatarConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkComponentAvatar

struct AvatarConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = AvatarConfiguration
    typealias ComponentUIView = UIView

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
                AvatarImplementationView(configuration: self.configuration)
            },
            mainItemsView: {
                self.itemsView()
            }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "type",
            values: AvatarType.allCases,
            selectedValue: self.configuration.type
        )

        EnumConfigurationItemView(
            name: "source",
            values: AvatarSource.allCases,
            selectedValue: self.configuration.source
        )

        if self.configuration.wrappedValue.source == .url {
            ToggleConfigurationItemView(
                name: "url contains image",
                isOn: self.configuration.urlContainsImage
            )
        }

        EnumConfigurationItemView(
            name: "size",
            values: AvatarSize.allCases,
            selectedValue: self.configuration.size
        )

        OptionalEnumConfigurationItemView(
            name: "corner type",
            values: AvatarCornerType.allCases,
            selectedValue: self.configuration.cornerType
        )

        ToggleConfigurationItemView(
            name: "is action",
            isOn: self.configuration.isAction
        )

        if self.configuration.wrappedValue.cornerType == .button, self.configuration.wrappedValue.isAction {
            EnumConfigurationItemView(
                name: "action type",
                values: AvatarActionType.allCases,
                selectedValue: self.configuration.actionType
            )
        }

        if self.configuration.wrappedValue.cornerType == .badge {
            EnumConfigurationItemView(
                name: "badge intent",
                values: BadgeIntent.allCases,
                selectedValue: self.configuration.badgeIntent
            )
        }

        ToggleConfigurationItemView(
            name: "is border",
            isOn: self.configuration.isBorder
        )

        if self.configuration.wrappedValue.type == .user {
            TextFieldConfigurationItemView(
                name: "username",
                text: self.configuration.username
            )
        }
    }
}
