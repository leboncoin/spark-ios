//
//  SegmentedGaugeSize.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

/// The size of the segmented gauge.
public enum SegmentedGaugeSize: CaseIterable {
    case small
    case medium

    // MARK: - Properties

    /// The default case. Equals to **.medium**.
    public static let `default`: Self = .medium
}
