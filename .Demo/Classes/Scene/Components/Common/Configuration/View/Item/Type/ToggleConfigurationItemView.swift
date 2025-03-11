//
//  ToggleConfigurationItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 16/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ToggleConfigurationItemView: View {

    // MARK: - Properties

    let name: String
    let isOn: Binding<Bool>

    // MARK: - View

    var body: some View {
        ConfigurationItemView(name: self.name, spacing: .small) {
            Toggle(isOn: self.isOn, label: {})
                .labelsHidden()
        }
    }
}
