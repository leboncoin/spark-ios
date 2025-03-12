//
//  TextFieldConfigurationItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 16/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct TextFieldConfigurationItemView: View {

    // MARK: - Properties

    let name: String
    let placeholder: String?
    let text: Binding<String>
    let keyboardType: UIKeyboardType
    let orientation: Orientation

    @FocusState private var focusedField: Bool

    // MARK: - Initialization

    init(
        name: String,
        placeholder: String? = nil,
        text: Binding<String>,
        keyboardType: UIKeyboardType = .default,
        orientation: Orientation = .horizontal
    ) {
        self.name = name
        self.placeholder = placeholder
        self.text = text
        self.keyboardType = keyboardType
        self.orientation = orientation
    }

    // MARK: - View

    var body: some View {
        ConfigurationItemView(
            name: self.name,
            spacing: .small,
            orientation: self.orientation
        ) {
            TextField(
                name: self.name,
                placeholder: self.placeholder,
                text: self.text,
                keyboardType: self.keyboardType
            )
        }
    }
}

struct TextField: View {

    // MARK: - Properties

    let name: String
    let placeholder: String?
    let text: Binding<String>
    let keyboardType: UIKeyboardType

    @FocusState private var focusedField: Bool

    // MARK: - Initialization

    init(
        name: String,
        placeholder: String? = nil,
        text: Binding<String>,
        keyboardType: UIKeyboardType = .default
    ) {
        self.name = name
        self.placeholder = placeholder
        self.text = text
        self.keyboardType = keyboardType
    }

    // MARK: - View

    var body: some View {
        SwiftUI.TextField((self.placeholder ?? self.name).capitalized, text: self.text)
            .padding(.vertical, .xSmall)
            .padding(.horizontal, .small)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .keyboardType(self.keyboardType)
            .focused(self.$focusedField)
            .toolbarIfNeeded(
                from: self.keyboardType,
                focused: self.$focusedField,
                action: {
                    self.focusedField = false
                })
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func toolbarIfNeeded(
        from keyboardType: UIKeyboardType,
        focused: FocusState<Bool>.Binding,
        action: @escaping () -> Void
    ) -> some View {
        self.toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                if keyboardType != .default, focused.wrappedValue {
                    Spacer()
                    Button("Done", action: action)
                }
            }
        }
    }
}
