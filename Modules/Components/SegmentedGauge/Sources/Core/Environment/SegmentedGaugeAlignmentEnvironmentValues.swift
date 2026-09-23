//
//  SegmentedGaugeAlignmentEnvironmentValues.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var segmentedGaugeAlignment: SegmentedGaugeAlignment = .default
}

public extension View {

    /// Set the **alignment** on the ``SparkSegmentedGauge``.
    ///
    /// The default value for this property is *SegmentedGaugeAlignment.default*.
    func sparkSegmentedGaugeAlignment(_ alignment: SegmentedGaugeAlignment) -> some View {
        self.environment(\.segmentedGaugeAlignment, alignment)
    }
}
