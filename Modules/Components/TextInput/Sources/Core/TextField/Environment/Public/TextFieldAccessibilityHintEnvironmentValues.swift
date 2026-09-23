//
//  TextFieldAccessibilityHintEnvironmentValues.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 04/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textFieldAccessibilityHint: String?
}

public extension View {

    /// A custom accessibility hint for the text field.
    func sparkTextFieldAccessibilityHint(_ value: String) -> some View {
        self.environment(\.textFieldAccessibilityHint, value)
    }
}
