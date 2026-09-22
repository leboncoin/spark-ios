//
//  SegmentedGaugeTestingType.swift
//  SparkComponentSegmentedGaugeSnapshotTests
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedGauge
import SparkTheming

@_spi(SI_SPI) public enum SegmentedGaugeTestingType: CaseIterable {
    case veryHigh
    case high
    case medium
    case low
    case veryLow
    case noData
    case customDimmed
    case custom

    // MARK: - Properties

    /// The default case. Equals to **.veryHigh**.
    public static let `default`: Self = .veryHigh

    // MARK: - Methods

    public func toType(_ theme: any Theme) -> SegmentedGaugeType {
        switch self {
        case .veryHigh: .veryHigh
        case .high: .high
        case .medium: .medium
        case .low: .low
        case .veryLow: .veryLow
        case .noData: .noData
        case .custom, .customDimmed: .custom(
            level: 1,
            colorToken: theme.colors.main.main,
            dim: self == .customDimmed ? 0.5 : 1
        )
        }
    }
}
