//
//  SegmentedGaugeSegments.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

/// The number of segments of the segmented gauge.
public enum SegmentedGaugeSegments: CaseIterable {
    case three
    case five

    // MARK: - Properties

    /// The default case. Equals to **.medium**.
    public static let `default`: Self = .five

    /// Get the maximum number of segments
    static var max: Int {
        return 5
    }
}
