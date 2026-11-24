//
//  DotIndicatorConfigurationView.swift
//  SparkDemo
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkComponentDotIndicator

struct DotIndicatorConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = DotIndicatorConfiguration
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
                DotIndicatorImplementationView(configuration: self.configuration)
            },
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "size",
                    values: DotIndicatorSize.allCases,
                    selectedValue: self.configuration.size
                )

                EnumConfigurationItemView(
                    name: "intent",
                    values: DotIndicatorIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                StepperConfigurationItemView(
                    name: "number of pages",
                    value: self.configuration.numberOfPages,
                    bounds: 1...10,
                    step: 1
                )

                StepperConfigurationItemView(
                    name: "current page",
                    value: self.configuration.currentPage,
                    bounds: 0...9,
                    step: 1
                )

                ToggleConfigurationItemView(
                    name: "is interactive",
                    isOn: self.configuration.isInteractive
                )
            }
        )
    }
}
