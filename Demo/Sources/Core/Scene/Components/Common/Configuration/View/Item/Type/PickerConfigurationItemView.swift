//
//  PickerConfigurationItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 16/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct PickerConfigurationItemView<Value>: View where Value: Hashable {

    // MARK: - Properties

    let name: String
    let values: [Value]
    @Binding var selectedValue: Value

    // MARK: - View

    var body: some View {
        ConfigurationItemView(name: self.name) {
            Picker(self.pickerName(from: self.name), selection: self.$selectedValue) {
                ForEach(self.values.sorted(by: {
                    "\($0)" < "\($1)"
                }), id: \.self) { value in
                    self.pickerContent(from: value)
                }
            }
            .labelsHidden()
            .pickerStyle()
        }
    }
}

struct OptionalPickerConfigurationItemView<Value>: View where Value: Hashable {

    // MARK: - Properties

    let name: String
    let values: [Value]
    @Binding var selectedValue: Value?

    // MARK: - View

    var body: some View {
        ConfigurationItemView(name: self.name) {
            Picker(self.pickerName(from: self.name), selection: self.$selectedValue) {
                Text("No Value").tag(nil as Value?)

                ForEach(self.values.sorted(by: {
                    "\($0)" < "\($1)"
                }), id: \.self) { value in
                    self.pickerContent(from: value)
                }
            }
            .labelsHidden()
            .pickerStyle()
        }
    }
}

// MARK: - Extension

extension PickerConfigurationItemView: PickerContent {
}

extension OptionalPickerConfigurationItemView: PickerContent {
}

extension View {

    func pickerStyle() -> some View {
        self.pickerStyle(.menu)
    }
}

// MARK: - Private Protocol

private protocol PickerContent {
}

extension PickerContent {

    func pickerName(from name: String) -> String {
        "\(name.capitalized) selection"
    }

    @ViewBuilder
    func pickerContent<Value>(from value: Value) -> some View where Value: Hashable {
        switch value {
        case let icon as Iconography:
            Label(title: {
                Text(icon.name)
            }, icon: {
                Image(icon: icon)
            }).tag(value)
        case let token as ColorTokens:
            Label(token.name, systemImage: "circle.fill")
                .tint(token.value)
            .tag(value)
        case let theme as DemoThemes.Theme:
            Text(theme.name).tag(value)
        case let enumeration as CustomStringConvertible:
            Text(enumeration.description).tag(value)
        case let enumeration as any CaseIterable:
            Text(enumeration.name).tag(value)
        default:
            let text = "\(value)".addSpacesBeforeCapitalLetter.capitalized
            Text(text).tag(value)
        }
    }
}
