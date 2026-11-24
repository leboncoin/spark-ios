//
//  DotIndicatorIntentEnvironmentValues.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var dotIndicatorIntent: DotIndicatorIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkDotIndicator``.
    ///
    /// The default value for this property is *DotIndicatorIntent.default*.
    func sparkDotIndicatorIntent(_ intent: DotIndicatorIntent) -> some View {
        self.environment(\.dotIndicatorIntent, intent)
    }
}
