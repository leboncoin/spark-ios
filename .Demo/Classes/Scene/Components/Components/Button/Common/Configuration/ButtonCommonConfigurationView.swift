//
//  ButtonCommonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ButtonCommonConfigurationView<Configuration: ButtonConfiguration>: View {

    // MARK: - Properties

    let id: UUID = UUID()
    let configuration: Binding<Configuration>
    let isIconButton: Bool
    let framework: Framework

    // MARK: - View

    var body: some View {
        EnumConfigurationItemView(
            name: "intent",
            values: ButtonIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "variant",
            values: ButtonVariant.allCases,
            selectedValue: self.configuration.variant
        )

        EnumConfigurationItemView(
            name: "size",
            values: ButtonSize.allCases,
            selectedValue: self.configuration.size
        )

        EnumConfigurationItemView(
            name: "shape",
            values: ButtonShape.allCases,
            selectedValue: self.configuration.shape
        )

        if !self.isIconButton { // Only for the button
            EnumConfigurationItemView(
                name: "alignment",
                values: ButtonAlignment.allCases,
                selectedValue: self.configuration.alignment
            )

            if !self.framework.isUIKit {
                ToggleConfigurationItemView(
                    name: "is ∞ width",
                    isOn: self.configuration.swiftUIIsFullWidth
                )
            }
        }

        if !self.framework.isUIKit {
            ToggleConfigurationItemView(
                name: "is toggle",
                isOn: self.configuration.swiftUIIsToggle
            )
        }

        if self.framework.isUIKit {
            ToggleConfigurationItemView(
                name: "is animated",
                isOn: self.configuration.uiKitIsAnimated
            )
        }
    }
}

// MARK: - Other Configuration View

struct ButtonCommonOtherConfigurationView<Configuration: ButtonConfiguration>: View {

    // MARK: - Properties

    let id: UUID = UUID()
    let configuration: Binding<Configuration>
    let isIconButton: Bool

    // MARK: - View

    var body: some View {
        ForEach(ControlState.allCases, id: \.self) { state in
            let content = switch state {
            case .normal: self.configuration.contentNormal
            case .highlighted: self.configuration.contentHighlighted
            case .disabled: self.configuration.contentDisabled
            case .selected: self.configuration.contentSelected
            }

            Section("\(state.name) State") {
                OptionalEnumConfigurationItemView(
                    name: "icon",
                    values: Iconography.allCases,
                    selectedValue: content.icon
                )

                if !self.isIconButton {
                    TextFieldConfigurationItemView(
                        name: "text",
                        text: content.title
                    )

                    ToggleConfigurationItemView(
                        name: "is attributed title",
                        isOn: content.isAttributedTitle
                    )
                }
            }
        }
    }
}
