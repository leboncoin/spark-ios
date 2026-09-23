//
//  ChipIntentEnvironmentValues.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var chipIntent: ChipIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkChip``.
    ///
    /// The default value for this property is *ChipIntent.support*.
    func sparkChipIntent(_ intent: ChipIntent) -> some View {
        self.environment(\.chipIntent, intent)
    }
}
