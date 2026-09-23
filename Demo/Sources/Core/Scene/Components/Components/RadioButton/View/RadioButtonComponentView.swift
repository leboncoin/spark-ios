//
//  RadioButtonComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias RadioButtonComponentView = ComponentViewable<RadioButtonConfiguration, RadioButtonImplementationView, RadioButtonConfigurationView, RadioButtonExtraTools>

// MARK: - Subview

struct RadioButtonImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<RadioButtonConfiguration>
    @State private var isSelected: Bool = .random()

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: .medium) {
            self.component()
                .sparkTheme(self.configurationWrapped.theme.value)
                .sparkRadioButtonIntent(self.configurationWrapped.intent)
                .sparkRadioButtonIsAnimated(self.configurationWrapped.isAnimated)
                .demoDisabled(self.configurationWrapped)
                .demoFrame(self.configurationWrapped)
                .demoAccessibilityLabel(self.configurationWrapped)

            Divider()

            Button("Reset", role: .destructive) {
                self.isSelected = false
            }
            .buttonStyle(.bordered)
        }
    }

    @ViewBuilder
    private func component() -> some View {
        if self.configurationWrapped.swiftUIIsCustomContent {
            SparkRadioButton(
                isSelected: self.$isSelected,
                label: {
                    VStack(alignment: .leading) {
                        Text(self.configurationWrapped.text)
                            .foregroundStyle(.orange)
                        Text(self.configurationWrapped.swiftUISecondText)
                            .font(.footnote)
                            .foregroundStyle(.blue)
                    }
                }
            )

        } else if let text = configurationWrapped.text.nilIfEmpty {
            SparkRadioButton(
                text,
                isSelected: self.$isSelected
            )
        } else {
            SparkRadioButton(
                isSelected: self.$isSelected
            )
        }
    }
}
