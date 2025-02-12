//
//  MicroAnimationConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI

struct MicroAnimationConfigurationView: ConfigurationViewable {

    // MARK: - Properties

    var configuration: Binding<MicroAnimationConfiguration>

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            componentViewType: MicroAnimationImplementationView.self,
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
