//
//  BadgeSizeEnvironmentValues.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var badgeSize: BadgeSize = .default
}

public extension View {

    /// Set the **size** on the ``SparkBadge``.
    ///
    /// The default value for this property is *BadgeSize.tinted*.
    func sparkBadgeSize(_ intent: BadgeSize) -> some View {
        self.environment(\.badgeSize, intent)
    }
}
