//
//  _FormatTextField.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 30/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

/// This view is implemented only by ``SparkTextField``.
/// No init is **public**.
public struct _FormatTextField<Value, Format>: _TextField where Format: ParseableFormatStyle, Format.FormatOutput == String, Format.FormatInput == Value {

    // MARK: - Properties

    let titleKey: LocalizedStringKey
    @Binding var value: Value
    let format: Format

    @Environment(\.textFieldPlaceholderColor) private var placeholderColor

    // MARK: - View

    public var body: some View {
        TextField(
            self.titleKey,
            value: self.$value,
            format: self.format,
            prompt: Text(self.titleKey)
                .foregroundColor(self.placeholderColor)
        )
    }
}
