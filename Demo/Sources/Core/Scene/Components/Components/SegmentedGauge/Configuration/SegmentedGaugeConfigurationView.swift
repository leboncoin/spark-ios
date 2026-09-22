//
//  SegmentedGaugeConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct SegmentedGaugeConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = SegmentedGaugeConfiguration
    typealias ComponentUIView = SparkUISegmentedGauge

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
                    SegmentedGaugeImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                self.itemsView()
            },
            otherSectionItemsView: {
                self.typeItemsView()
            }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {

        EnumConfigurationItemView(
            name: "segments",
            values: SegmentedGaugeSegments.allCases,
            selectedValue: self.configuration.segments
        )

        EnumConfigurationItemView(
            name: "size",
            values: SegmentedGaugeSize.allCases,
            selectedValue: self.configuration.size
        )

        EnumConfigurationItemView(
            name: "alignment",
            values: SegmentedGaugeAlignment.allCases,
            selectedValue: self.configuration.alignment
        )

        ToggleConfigurationItemView(
            name: "with marker",
            isOn: self.configuration.withMarker
        )

        TextFieldConfigurationItemView(
            name: "title",
            text: self.configuration.title
        )

        if self.framework.isSwiftUI {
            ToggleConfigurationItemView(
                name: "is custom title",
                isOn: self.configuration.swiftUIIsCustomTitle
            )

            if self.configuration.wrappedValue.swiftUIIsCustomTitle {
                TextFieldConfigurationItemView(
                    name: "second title",
                    text: self.configuration.swiftUICustomTitle
                )
            }

        } else {
            ToggleConfigurationItemView(
                name: "is attributed title",
                isOn: self.configuration.uiKitIsAttributedTitle
            )
        }

        TextFieldConfigurationItemView(
            name: "description",
            text: self.configuration.description
        )

        if self.framework.isSwiftUI {
            ToggleConfigurationItemView(
                name: "is custom description",
                isOn: self.configuration.swiftUIIsCustomDescription
            )

            if self.configuration.wrappedValue.swiftUIIsCustomDescription {
                TextFieldConfigurationItemView(
                    name: "second description",
                    text: self.configuration.swiftUICustomDescription
                )
            }

        } else {
            ToggleConfigurationItemView(
                name: "is attributed description",
                isOn: self.configuration.uiKitIsAttributedDescription
            )
        }
    }

    @ViewBuilder
    private func typeItemsView() -> some View {

        EnumConfigurationItemView(
            name: "type",
            values: SegmentedGaugeDemoType.allCases,
            selectedValue: self.configuration.type
        )

        if self.configuration.wrappedValue.type == .custom {
            StepperConfigurationItemView(
                name: "Current level",
                value: self.configuration.typeCustomLevel,
                bounds: 0...5
            )

            ColorTokensConfigurationItemView(
                selectedValue: self.configuration.typeCustomColorToken
            )

            StepperConfigurationItemView(
                name: "opacity",
                value: self.configuration.typeCustomOpacity,
                bounds: 0...100,
                step: 10
            )
        }
    }
}
