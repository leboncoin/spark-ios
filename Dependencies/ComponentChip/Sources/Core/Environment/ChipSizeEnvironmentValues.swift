//
//  ChipSizeEnvironmentValues.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var chipSize: ChipSize = .default
}

public extension View {

    /// Set the **size** on the ``SparkChip``.
    ///
    /// The default value for this property is *ChipSize.medium*.
    func sparkChipSize(_ size: ChipSize) -> some View {
        self.environment(\.chipSize, size)
    }
}
