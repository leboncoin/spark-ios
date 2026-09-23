//
//  SliderConfigurationItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 16/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct SliderConfigurationItemView<Value>: View where Value: BinaryFloatingPoint, Value.Stride: BinaryFloatingPoint {

    // MARK: - Properties

    let name: String?
    @Binding var selectedValue: Value
    let range: ClosedRange<Value>
    let step: Value.Stride
    var showValue: Bool = false

    // MARK: - View

    var body: some View {
        ConfigurationItemView(name: self.name) {
            HStack {
                Slider(value: self.$selectedValue, in: self.range, step: self.step)

                if self.showValue {
                    Text("\(self.selectedValue)")
                }
            }
        }
    }
}
