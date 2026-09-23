//
//  BadgeIsBorderEnvironmentValues.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var badgeIsBorder: Bool = true
}

public extension View {

    /// Set the **isBorder** on the ``SparkBadge``.
    /// If the value is true, a border will be applied.
    ///
    /// The default value for this property is *true*.
    func sparkBadgeIsBorder(_ isBorder: Bool) -> some View {
        self.environment(\.badgeIsBorder, isBorder)
    }
}
