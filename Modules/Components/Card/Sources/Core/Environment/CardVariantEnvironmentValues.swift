//
//  CardVariantEnvironmentValues.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var cardVariant: CardVariant = .default
}

public extension View {

    /// Set the **variant** on the ``SparkCard``.
    ///
    /// The default value for this property is *CardVariant.default*.
    func sparkCardVariant(_ variant: CardVariant) -> some View {
        self.environment(\.cardVariant, variant)
    }
}
