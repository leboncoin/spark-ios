//
//  ProgressBarConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct ProgressBarConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<ProgressBarConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: ProgressBarImplementationView.self,
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
