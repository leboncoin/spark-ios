//
//  ColorTokensConfigurationItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ColorTokensConfigurationItemView: View {

    // MARK: - Properties

    @Binding var selectedValue: ColorTokens

    // MARK: - View

    var body: some View {
        EnumConfigurationItemView(
            name: "color token",
            values: ColorTokens.allCases,
            selectedValue: self.$selectedValue
        )
        .tint(self.selectedValue.value)
    }
}
