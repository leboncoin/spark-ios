//
//  SegmentedGaugeAlignment.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

/// The alignment of the segmented gauge between the segments and the description.
public enum SegmentedGaugeAlignment: CaseIterable {
    case horizontal
    case vertical

    // MARK: - Properties

    /// The default case. Equals to **.horizontal**.
    public static let `default`: Self = .horizontal
}
