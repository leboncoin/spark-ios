//
//  SliderConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct SliderConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = SliderConfiguration
    typealias ComponentUIView = SparkUISlider

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
                    SliderImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: { self.itemsView() },
            otherSectionItemsView: { self.otherSectionItemsView() }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "intent",
            values: SliderIntent.allCases,
            selectedValue: self.configuration.intent
        )

        ToggleConfigurationItemView(
            name: "is step",
            isOn: self.configuration.isStep
        )

        if self.configuration.isStep.wrappedValue {
            TextFieldConfigurationItemView(
                name: "step",
                text: self.configuration.stepString,
                keyboardType: .numberPad
            )
        } else {
            ToggleConfigurationItemView(
                name: "is continuous",
                isOn: self.configuration.uiKitIsContinuous
            )
        }

        HStack {
            TextFieldConfigurationItemView(
                name: "bounds",
                placeholder: "min",
                text: self.configuration.lowerBoundString,
                keyboardType: .numberPad
            )

            TextField(
                name: "max",
                text: self.configuration.upperBoundString,
                keyboardType: .numberPad
            )
        }
    }

    @ViewBuilder
    private func otherSectionItemsView() -> some View {
        Section("Label") {
            TextFieldConfigurationItemView(
                name: "title",
                text: self.configuration.titleString
            )

            ToggleConfigurationItemView(
                name: "is value label",
                isOn: self.configuration.isValueLabel
            )

            if self.configuration.wrappedValue.isValueLabel {
                TextFieldConfigurationItemView(
                    name: "custom value label",
                    text: self.configuration.customValueLabel,
                    orientation: .vertical
                )

                ToggleConfigurationItemView(
                    name: "is floating value label",
                    isOn: self.configuration.isFloatingValueLabel
                )
            }

            ToggleConfigurationItemView(
                name: "is range values label",
                isOn: self.configuration.isRangeValuesLabel
            )

            if self.configuration.isValueLabel.wrappedValue || self.configuration.isRangeValuesLabel.wrappedValue {

                if self.framework.isUIKit {
                    ToggleConfigurationItemView(
                        name: "is attributed text",
                        isOn: self.configuration.uiKitIsAttributedText
                    )
                } else {
                    ToggleConfigurationItemView(
                        name: "is custom content",
                        isOn: self.configuration.swiftUIIsCustomValue
                    )

                    if self.configuration.wrappedValue.swiftUIIsCustomValue {
                        TextFieldConfigurationItemView(
                            name: "second text",
                            text: self.configuration.swiftUISecondText
                        )
                    }
                }
            }
        }
    }
}
