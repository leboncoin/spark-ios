//
//  TextEditorAccessibilityValueEnvironmentValues.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 04/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textEditorAccessibilityValue: String?
}

public extension View {

    /// A custom accessibility value for the text editor.
    ///
    /// By default, the value read corresponding to the String(describing:) func.
    /// Use this extension to change this value.
    func sparkTextEditorAccessibilityValue(_ value: String) -> some View {
        self.environment(\.textEditorAccessibilityValue, value)
    }
}
