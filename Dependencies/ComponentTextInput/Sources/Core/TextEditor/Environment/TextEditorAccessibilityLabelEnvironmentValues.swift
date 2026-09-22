//
//  TextEditorAccessibilityLabelEnvironmentValues.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 04/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textEditorAccessibilityLabel: String?
}

public extension View {

    /// A custom accessibility hint for the text editor.
    ///
    /// By default, the value read corresponding to the titleKey (placeholder).
    /// Use this extension to change this value.
    func sparkTextEditorAccessibilityLabel(_ value: String) -> some View {
        self.environment(\.textEditorAccessibilityLabel, value)
    }
}
