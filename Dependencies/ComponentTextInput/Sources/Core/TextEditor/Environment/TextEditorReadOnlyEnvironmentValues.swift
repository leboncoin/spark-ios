//
//  TextEditorReadOnlyEnvironmentValues.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 04/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textEditorReadOnly: Bool = false
}

public extension View {

    /// Set the **read only**  on the ``SparkTextEditor``.
    ///
    /// The standard clear button displays at the right side of the text editor when the text editor has contents, providing a way for the user to remove text quickly.
    /// This button appears automatically based on the value of this property. The default value for this property is *false*.
    func sparkTextEditorReadOnly(_ isReadOnly: Bool) -> some View {
        self.environment(\.textEditorReadOnly, isReadOnly)
    }
}
