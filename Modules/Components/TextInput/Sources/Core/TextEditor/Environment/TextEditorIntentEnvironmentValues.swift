//
//  TextEditorIntentEnvironmentValues.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 04/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textEditorIntent: TextEditorIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkTextEditor``.
    ///
    /// The default value for this property is *TextEditorIntent.neutral*.
    func sparkTextEditorIntent(_ intent: TextEditorIntent) -> some View {
        self.environment(\.textEditorIntent, intent)
    }
}
