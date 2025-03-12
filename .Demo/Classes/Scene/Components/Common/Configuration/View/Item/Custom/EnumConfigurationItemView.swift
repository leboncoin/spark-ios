//
//  EnumConfigurationItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 16/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct EnumConfigurationItemView<Value>: View where Value: CaseIterable & Hashable {

    // MARK: - Properties

    let name: String
    let values: [Value]
    @Binding var selectedValue: Value

    // MARK: - View

    var body: some View {
        PickerConfigurationItemView(
            name: self.name,
            values: self.values,
            selectedValue: self.$selectedValue
        )
    }
}

struct OptionalEnumConfigurationItemView<Value>: View where Value: CaseIterable & Hashable {

    // MARK: - Properties

    let name: String
    let values: [Value]
    @Binding var selectedValue: Value?

    // MARK: - View

    var body: some View {
        OptionalPickerConfigurationItemView(
            name: self.name,
            values: self.values,
            selectedValue: self.$selectedValue
        )
    }
}
