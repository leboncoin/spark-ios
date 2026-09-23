//
//  SegmentedGaugeSizeEnvironmentValues.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var segmentedGaugeSize: SegmentedGaugeSize = .default
}

public extension View {

    /// Set the **size** on the ``SparkSegmentedGauge``.
    ///
    /// The default value for this property is *SegmentedGaugeSize.default*.
    func sparkSegmentedGaugeSize(_ size: SegmentedGaugeSize) -> some View {
        self.environment(\.segmentedGaugeSize, size)
    }
}
