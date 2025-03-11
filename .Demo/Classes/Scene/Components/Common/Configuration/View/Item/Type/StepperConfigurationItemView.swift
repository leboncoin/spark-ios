//
//  StepperConfigurationItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 16/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct StepperConfigurationItemView<V: Strideable>: View {

    // MARK: - Properties

    let name: String
    let value: Binding<V>
    let bounds: ClosedRange<V>
    let step: V.Stride

    // MARK: - View

    var body: some View {
        ConfigurationItemView(name: self.name, spacing: .small) {
            HStack(alignment: .center, spacing: .medium) {
                Stepper(
                    self.name,
                    value: self.value,
                    in: self.bounds,
                    step: self.step
                )
                .labelsHidden()

                Text("\(self.value.wrappedValue)")
            }

        }
    }
}

extension StepperConfigurationItemView where V: BinaryInteger {

    // MARK: - Initialization

    init(
        name: String,
        value: Binding<V>,
        bounds: ClosedRange<V>,
        step: V.Stride = 1
    ) {
        self.name = name
        self.value = value
        self.bounds = bounds
        self.step = step
    }
}
