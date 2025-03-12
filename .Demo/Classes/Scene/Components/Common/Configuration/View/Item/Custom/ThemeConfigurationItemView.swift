//
//  ThemeConfigurationItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ThemeConfigurationItemView: View {

    // MARK: - Properties

    let name: String
    let values: [DemoThemes.Theme]
    @Binding var selectedValue: DemoThemes.Theme

    // MARK: - View

    var body: some View {
        PickerConfigurationItemView(
            name: self.name,
            values: self.values,
            selectedValue: self.$selectedValue
        )
    }
}
