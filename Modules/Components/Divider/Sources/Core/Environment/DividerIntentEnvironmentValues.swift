//
//  DividerIntentEnvironmentValues.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var dividerIntent: DividerIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkDivider``.
    ///
    /// Check the ``DividerIntent`` to see the **default** value.
    func sparkDividerIntent(_ intent: DividerIntent) -> some View {
        self.environment(\.dividerIntent, intent)
    }
}
