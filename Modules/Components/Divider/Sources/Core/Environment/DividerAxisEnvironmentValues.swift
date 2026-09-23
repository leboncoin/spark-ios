//
//  DividerAxisEnvironmentValues.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var dividerAxis: DividerAxis = .default
}

public extension View {

    /// Set the **variant** on the ``SparkDivider``.
    ///
    /// Check the ``DividerAxis`` to see the **default** value.
    func sparkDividerAxis(_ intent: DividerAxis) -> some View {
        self.environment(\.dividerAxis, intent)
    }
}
