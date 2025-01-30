//
//  ButtonCommonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct ButtonCommonConfigurationView<Configuration: ButtonConfiguration>: View {

    // MARK: - Properties

    let configuration: Binding<Configuration>
    let isIconButton: Bool

    // MARK: - View

    var body: some View {
        EnumConfigurationView(
            name: "intent",
            values: ButtonIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationView(
            name: "variant",
            values: ButtonVariant.allCases,
            selectedValue: self.configuration.variant
        )

        EnumConfigurationView(
            name: "size",
            values: ButtonSize.allCases,
            selectedValue: self.configuration.size
        )

        EnumConfigurationView(
            name: "shape",
            values: ButtonShape.allCases,
            selectedValue: self.configuration.shape
        )

        if !self.isIconButton { // Only for the button
            EnumConfigurationView(
                name: "alignment",
                values: ButtonAlignment.allCases,
                selectedValue: self.configuration.alignment
            )

            ToggleConfigurationView(
                name: "is ∞ width",
                isOn: self.configuration.isFullWidth
            )
        }

        ToggleConfigurationView(
            name: "is toggle",
            isOn: self.configuration.isToggle
        )

        Divider()

        ForEach(ControlState.allCases, id: \.self) { state in
            self.content(for: state)
        }

        Divider()
    }

    // MARK: - Content

    @ViewBuilder
    private func content(for state: ControlState) -> some View {
        let content = switch state {
        case .normal: self.configuration.contentNormal
        case .highlighted: self.configuration.contentHighlighted
        case .disabled: self.configuration.contentDisabled
        case .selected: self.configuration.contentSelected
        }

        OptionalEnumConfigurationView(
            name: "icon (\(state) state)",
            values: Iconography.allCases,
            selectedValue: content.icon
        )

        if !self.isIconButton {
            TextFieldConfigurationView(
                name: "text (\(state) state)",
                text: content.text
            )

            ToggleConfigurationView(
                name: "is atr. text (\(state) state)",
                isOn: content.isAttributedText
            )
        }
    }
}
