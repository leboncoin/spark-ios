//
//  DividerAlignmentEnvironmentValues.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var dividerAlignment: DividerAlignment = .default
}

public extension View {

    /// Set the **intent** on the ``SparkDivider``.
    ///
    /// Check the ``DividerAlignment`` to see the **default** value.
    func sparkDividerAlignment(_ intent: DividerAlignment) -> some View {
        self.environment(\.dividerAlignment, intent)
    }
}
