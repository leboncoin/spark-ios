//
//  BadgeIntentEnvironmentValues.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var badgeIntent: BadgeIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkBadge``.
    ///
    /// The default value for this property is *BadgeIntent.danger*.
    func sparkBadgeIntent(_ intent: BadgeIntent) -> some View {
        self.environment(\.badgeIntent, intent)
    }
}
