//
//  CircularMeterIntentEnvironmentValues.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var circularMeterIntent: CircularMeterIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkCircularMeter``.
    ///
    /// The default value for this property is *CircularMeterIntent.default*.
    func sparkCircularMeterIntent(_ intent: CircularMeterIntent) -> some View {
        self.environment(\.circularMeterIntent, intent)
    }
}
