//
//  TextFieldAccessibilityValueEnvironmentValues.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 04/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textFieldAccessibilityValue: String?
}

public extension View {

    /// A custom accessibility value for the text field.
    ///
    /// By default, the value read corresponding to the String(describing:) func.
    /// Use this extension to change this value.
    func sparkTextFieldAccessibilityValue(_ value: String) -> some View {
        self.environment(\.textFieldAccessibilityValue, value)
    }
}
