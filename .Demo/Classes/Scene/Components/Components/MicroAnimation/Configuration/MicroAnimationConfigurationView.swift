//
//  MicroAnimationConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct MicroAnimationConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = MicroAnimationConfiguration
    typealias ComponentUIView = MicroAnimationContentUIView

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
                    MicroAnimationImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                EnumConfigurationItemView(
                    name: "type",
                    values: SparkAnimationType.allCases,
                    selectedValue: self.configuration.type
                )

                ToggleConfigurationItemView(
                    name: "is indefinitely",
                    isOn: self.configuration.isIndefinitely
                )

                if !self.configuration.wrappedValue.isIndefinitely {
                    StepperConfigurationItemView(
                        name: "repeat",
                        value: self.configuration.numberOfRepeat,
                        bounds: 1...5,
                        step: 1
                    )
                }
            }
        )
    }
}
