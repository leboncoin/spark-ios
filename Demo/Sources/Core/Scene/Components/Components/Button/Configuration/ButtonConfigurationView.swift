//
//  ButtonConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct ButtonConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = ButtonConfiguration
    typealias ComponentUIView = SparkUIButton

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
                    ButtonImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                self.itemsView()
            },
            otherSectionItemsView: {
                self.otherSectionItemsView()
            }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        OptionalEnumConfigurationItemView(
            name: "appearance",
            values: ButtonAppearance.allCases,
            selectedValue: self.configuration.appearance
        )

        if self.configuration.wrappedValue.appearance == nil {
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
        }

        EnumConfigurationItemView(
            name: "shape",
            values: ButtonShape.allCases,
            selectedValue: self.configuration.shape
        )

        EnumConfigurationItemView(
            name: "size",
            values: ButtonSize.allCases,
            selectedValue: self.configuration.size
        )

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

        ToggleConfigurationItemView(
            name: "is loading",
            isOn: self.configuration.isLoading
        )

        ToggleConfigurationItemView(
            name: "remove styles",
            isOn: self.configuration.removeStyles
        )

        ToggleConfigurationItemView(
            name: "animate icon",
            isOn: self.configuration.animateIcon
        )

        if self.framework.isSwiftUI {

            OptionalEnumConfigurationItemView(
                name: "icon",
                values: Iconography.allCases,
                selectedValue: self.configuration.swiftUIIcon
            )

            TextFieldConfigurationItemView(
                name: "title",
                text: self.configuration.swiftUITitle
            )

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

        EnumConfigurationItemView(
            name: "content visibility",
            values: ButtonContentVisibility.allCases,
            selectedValue: self.configuration.contentVisibility
        )

        ToggleConfigurationItemView(
            name: "has feedback (device only)",
            isOn: self.configuration.hasFeedback
        )

        if self.framework.isSwiftUI {
            ToggleConfigurationItemView(
                name: "is a menu",
                isOn: self.configuration.swiftUIIsMenu
            )
        }
    }

    @ViewBuilder
    private func otherSectionItemsView() -> some View {
        if self.framework.isUIKit {
            ForEach(ButtonControlState.allCases, id: \.rawValue) { state in
                let content = switch state {
                case .normal: self.configuration.uiKitContentNormal
                case .highlighted: self.configuration.uiKitContentHighlighted
                case .disabled: self.configuration.uiKitContentDisabled
                case .selected: self.configuration.uiKitContentSelected
                }

                Section("\(state.name) State") {
                    OptionalEnumConfigurationItemView(
                        name: "icon",
                        values: Iconography.allCases,
                        selectedValue: content.icon
                    )

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
        } else {
            EmptyView()
        }
    }
}
