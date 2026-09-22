//
//  CardIsHighlightedEnvironmentValues.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var cardIsHighlighted: Bool = false
}

public extension View {

    /// Set the **isHighlighted** on *sparkCornerRadius* or *sparkBorder* on the ``SparkCard``.
    ///
    /// The default value for this property is *false*.
    func sparkCardIsHighlighted(_ isHighlighted: Bool) -> some View {
        self.environment(\.cardIsHighlighted, isHighlighted)
    }
}
