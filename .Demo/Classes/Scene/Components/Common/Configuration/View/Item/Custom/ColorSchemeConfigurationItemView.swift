//
//  ColorSchemeConfigurationItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 16/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ColorSchemeConfigurationItemView: View {

    // MARK: - Properties

    @Binding var selectedValue: ColorScheme

    // MARK: - View

    var body: some View {
        ToggleConfigurationItemView(
            name: "Is Light Mode",
            isOn: Binding<Bool>(
                get: { self.selectedValue == .light },
                set: { value in
                    self.selectedValue = value ? .light : .dark
                }
            )
        )
    }
}
