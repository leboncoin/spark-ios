//
//  DotsIndicatorConfigurationView.swift
//  SparkDemo
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkComponentDotsIndicator

struct DotsIndicatorConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = DotsIndicatorConfiguration
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
                DotsIndicatorImplementationView(configuration: self.configuration)
            },
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "size",
                    values: DotsIndicatorSize.allCases,
                    selectedValue: self.configuration.size
                )

                EnumConfigurationItemView(
                    name: "intent",
                    values: DotsIndicatorIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                StepperConfigurationItemView(
                    name: "number of pages",
                    value: self.configuration.numberOfPages,
                    bounds: 1...10,
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
