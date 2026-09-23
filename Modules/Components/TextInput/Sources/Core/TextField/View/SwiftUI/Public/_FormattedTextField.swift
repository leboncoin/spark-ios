//
//  _FormattedTextField.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 30/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

/// This view is implemented only by ``SparkTextField``.
/// No init is **public**.
public struct _FormattedTextField<Value>: _TextField {

    // MARK: - Properties

    let titleKey: LocalizedStringKey
    @Binding var value: Value
    let formatter: Formatter

    @Environment(\.textFieldPlaceholderColor) private var placeholderColor

    // MARK: - View

    public var body: some View {
        TextField(
            self.titleKey,
            value: self.$value,
            formatter: self.formatter,
            prompt: Text(self.titleKey)
                .foregroundColor(self.placeholderColor)
        )
    }
}
