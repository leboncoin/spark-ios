//
//  TextEditorAccessibilityHintEnvironmentValues.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 04/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textEditorAccessibilityHint: String?
}

public extension View {

    /// A custom accessibility hint for the text editor.
    func sparkTextEditorAccessibilityHint(_ value: String) -> some View {
        self.environment(\.textEditorAccessibilityHint, value)
    }
}
