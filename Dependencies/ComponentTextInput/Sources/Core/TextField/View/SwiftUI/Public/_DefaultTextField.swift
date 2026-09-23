//
//  _DefaultTextField.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 30/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

/// This view is implemented only by ``SparkTextField``.
/// No init is **public**.
public struct _DefaultTextField: _TextField {

    // MARK: - Properties

    let titleKey: LocalizedStringKey
    @Binding var text: String

    @Environment(\.textFieldSecureEntry) private var isSecureEntry
    @Environment(\.textFieldPlaceholderColor) private var placeholderColor

    // MARK: - View

    public var body: some View {
        if self.isSecureEntry {
            SecureField(
                self.titleKey,
                text: self.$text,
                prompt: self.prompt()
            )
        } else {
            TextField(
                self.titleKey,
                text: self.$text,
                prompt: self.prompt()
            )
        }
    }

    // MARK: - View Builder

    private func prompt() -> Text {
        Text(self.titleKey).foregroundColor(self.placeholderColor)
    }

    // MARK: - Protocol Action

    public func isEmptyContent() -> Bool {
        self.text.isEmpty
    }

    public func clearAction() {
        self.text = ""
    }
}
