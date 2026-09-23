//
//  ChipVariantEnvironmentValues.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var chipVariant: ChipVariant = .default
}

public extension View {

    /// Set the **variant** on the ``SparkChip``.
    ///
    /// The default value for this property is *ChipVariant.tinted*.
    func sparkChipVariant(_ intent: ChipVariant) -> some View {
        self.environment(\.chipVariant, intent)
    }
}
