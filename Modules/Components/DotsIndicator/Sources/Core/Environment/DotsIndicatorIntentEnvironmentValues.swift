//
//  DotsIndicatorIntentEnvironmentValues.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var dotsIndicatorIntent: DotsIndicatorIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkDotsIndicator``.
    ///
    /// The default value for this property is *DotsIndicatorIntent.default*.
    func sparkDotsIndicatorIntent(_ intent: DotsIndicatorIntent) -> some View {
        self.environment(\.dotsIndicatorIntent, intent)
    }
}
