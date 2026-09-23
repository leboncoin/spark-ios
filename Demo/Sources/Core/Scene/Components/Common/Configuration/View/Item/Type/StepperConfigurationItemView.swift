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
    let unit: String?

    // MARK: - Initialization

    init(
        name: String,
        value: Binding<V>,
        bounds: ClosedRange<V>,
        step: V.Stride,
        unit: String? = nil
    ) {
        self.name = name
        self.value = value
        self.bounds = bounds
        self.step = step
        self.unit = unit
    }

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

                Group {
                    Text("\(self.value.wrappedValue)")
                    if let unit {
                        Text(" " + unit)
                    }
                }
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
        step: V.Stride = 1,
        unit: String? = nil
    ) {
        self.name = name
        self.value = value
        self.bounds = bounds
        self.step = step
        self.unit = unit
    }
}
