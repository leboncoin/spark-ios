//
//  CardHeaderPositionEnvironmentValues.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 11/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var cardHeaderPosition: CardHeaderPosition = .default
}

public extension View {

    /// Set the **header position** on the ``SparkCard``.
    ///
    /// The default value for this property is *CardHeaderPosition.default*.
    func sparkCardHeaderPosition(_ intent: CardHeaderPosition) -> some View {
        self.environment(\.cardHeaderPosition, intent)
    }
}
