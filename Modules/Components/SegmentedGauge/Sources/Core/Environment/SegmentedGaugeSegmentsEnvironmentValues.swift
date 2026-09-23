//
//  SegmentedGaugeSegmentsEnvironmentValues.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var segmentedGaugeSegments: SegmentedGaugeSegments = .default
}

public extension View {

    /// Set the **segments** on the ``SparkSegmentedGauge``.
    ///
    /// The default value for this property is *SegmentedGaugeSegments.default*.
    func sparkSegmentedGaugeSegments(_ segments: SegmentedGaugeSegments) -> some View {
        self.environment(\.segmentedGaugeSegments, segments)
    }
}
