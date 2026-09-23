//
//  SegmentedGaugeWithMarkerEnvironmentValues.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var segmentedGaugeWithMarker = true
}

public extension View {

    /// Set the **withMarker** on the ``SparkSegmentedGauge``.
    ///
    /// The default value for this property is *true*.
    func sparkSegmentedGaugeWithMarker(_ withMarker: Bool) -> some View {
        self.environment(\.segmentedGaugeWithMarker, withMarker)
    }
}
