//
//  BorderConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct BorderConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = BorderConfiguration
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
                if let componentImplementationViewRepresentable {
                    componentImplementationViewRepresentable
                } else {
                    BorderImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: { self.itemsView() }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "width",
            values: BorderDefault.Width.allCases,
            selectedValue: self.configuration.width
        )

        EnumConfigurationItemView(
            name: "position",
            values: BorderPosition.allCases,
            selectedValue: self.configuration.position
        )

        StepperConfigurationItemView(
            name: "dash",
            value: self.configuration.dash,
            bounds: 0...20,
            step: 1
        )

        if self.framework.isSwiftUI {
            ToggleConfigurationItemView(
                name: "is scaled",
                isOn: self.configuration.swiftUIIsScaled
            )
        }
    }
}
