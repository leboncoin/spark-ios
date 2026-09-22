//
//  CornerRadiusConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct CornerRadiusConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = CornerRadiusConfiguration
    typealias ComponentUIView = CornerRadiusUIView

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
                    CornerRadiusImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: { self.itemsView() }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {

        EnumConfigurationItemView(
            name: "radius",
            values: BorderDefault.Radius.allCases,
            selectedValue: self.configuration.radius
        )

        if self.framework.isSwiftUI && self.configuration.wrappedValue.radius == .custom {
            SliderConfigurationItemView(
                name: "Top leading radius",
                selectedValue: self.configuration.topLeadingRadius
            )

            SliderConfigurationItemView(
                name: "Top trailing radius",
                selectedValue: self.configuration.topTrailingRadius
            )

            SliderConfigurationItemView(
                name: "Bottom leading radius",
                selectedValue: self.configuration.bottomLeadingRadius
            )

            SliderConfigurationItemView(
                name: "Bottom trailing radius",
                selectedValue: self.configuration.bottomTrailingRadius
            )
        }

        ToggleConfigurationItemView(
            name: "is highlighted",
            isOn: self.configuration.isHighlighted
        )

        if self.framework.isSwiftUI {
            ToggleConfigurationItemView(
                name: "is scaled",
                isOn: self.configuration.swiftUIIsScaled
            )
        }
    }
}

// MARK: - Extension

private extension SliderConfigurationItemView {

    init(name: String, selectedValue: Binding<Value>) {
        self.init(
            name: name,
            selectedValue: selectedValue,
            range: 0...36,
            step: 2,
            showValue: true
        )
    }
}

