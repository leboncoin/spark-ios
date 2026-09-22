//
//  SegmentedGaugeTypeEnvironmentValues.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var segmentedGaugeType: SegmentedGaugeType = .default
}

public extension View {

    /// Set the **type** on the ``SparkSegmentedGauge``.
    ///
    /// The default value for this property is *SegmentedGaugeType.default*.
    func sparkSegmentedGaugeType(_ type: SegmentedGaugeType) -> some View {
        self.environment(\.segmentedGaugeType, type)
    }
}
