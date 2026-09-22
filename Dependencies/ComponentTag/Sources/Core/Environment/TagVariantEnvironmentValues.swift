//
//  TagVariantEnvironmentValues.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tagVariant: TagVariant = .default
}

public extension View {

    /// Set the **variant** on the ``SparkTag``.
    ///
    /// The default value for this property is *TagVariant.filled*.
    func sparkTagVariant(_ variant: TagVariant) -> some View {
        self.environment(\.tagVariant, variant)
    }
}
