//
//  CardIntentEnvironmentValues.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var cardIntent: CardIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkCard``.
    ///
    /// The default value for this property is *CardIntent.default*.
    func sparkCardIntent(_ intent: CardIntent) -> some View {
        self.environment(\.cardIntent, intent)
    }
}
