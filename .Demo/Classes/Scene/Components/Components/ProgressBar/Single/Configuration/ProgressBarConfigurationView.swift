//
//  ProgressBarConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ProgressBarConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = ProgressBarConfiguration
    typealias ComponentUIView = ProgressBarUIView

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
                    ProgressBarImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "intent",
                    values: ProgressBarIntent.allCases,
                    selectedValue: self.configuration.intent
                )

                EnumConfigurationItemView(
                    name: "shape",
                    values: ProgressBarShape.allCases,
                    selectedValue: self.configuration.shape
                )

                StepperConfigurationItemView(
                    name: "value",
                    value: self.configuration.value,
                    bounds: 0...100,
                    step: self.configuration.step.wrappedValue
                )

                StepperConfigurationItemView(
                    name: "stepper",
                    value: self.configuration.step,
                    bounds: 0...100,
                    step: 1
                )
            }
        )
    }
}
