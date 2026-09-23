//
//  ChipAlignmentEnvironmentValues.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var chipAlignment: ChipAlignment = .default
}

public extension View {

    /// Set the **intent** on the ``SparkChip``.
    ///
    /// The default value for this property is *ChipAlignment.leadingIcon*.
    func sparkChipAlignment(_ intent: ChipAlignment) -> some View {
        self.environment(\.chipAlignment, intent)
    }
}
