//
//  TypographyCustomView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 08/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming

struct TypographyCustomView: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    @State private var size: CGFloat = 16
    @State private var weight: TypographyFontWeight = .regular
    @State private var style: TypographyFontStyle = .body
    @State private var text = "Abg"
    @State private var compareFonts = true

    // MARK: - View

    var body: some View {
        VStack(spacing: .medium) {
            Form {
                Section("Content") {

                    HStack(spacing: .medium) {

                        VStack {
                            Text(self.text)
                                .font(self.theme.value.typography.custom(
                                    size: self.size,
                                    weight: self.weight,
                                    style: self.style
                                ))

                            if self.compareFonts {
                                self.fontDescriptionText("spark")
                            }
                        }
                        .frame(maxWidth: .infinity)

                        // Show the native fonts
                        if self.compareFonts {

                            Divider()

                            VStack {
                                Text(self.text)
                                    .font(.system(
                                        size: self.size,
                                        weight: .init(from: self.weight)
                                    ))

                                self.fontDescriptionText("native")
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }

                Section("Configuration") {
                    SliderConfigurationItemView(
                        name: "size",
                        selectedValue: self.$size,
                        range: 8...100,
                        step: 2,
                        showValue: true
                    )

                    EnumConfigurationItemView(
                        name: "weight",
                        values: TypographyFontWeight.allCases,
                        selectedValue: self.$weight
                    )

                    EnumConfigurationItemView(
                        name: "style",
                        values: TypographyFontStyle.allCases,
                        selectedValue: self.$style
                    )

                    ToggleConfigurationItemView(
                        name: "Compare fonts",
                        isOn: self.$compareFonts
                    )

                    TextFieldConfigurationItemView(
                        name: "text",
                        text: self.$text
                    )
                }
            }

        }
        .navigationBarTitle("Custom Typography")
    }

    private func fontDescriptionText(_ value: String) -> some View {
        Text(value)
            .foregroundStyle(.gray)
            .italic()
    }
}
