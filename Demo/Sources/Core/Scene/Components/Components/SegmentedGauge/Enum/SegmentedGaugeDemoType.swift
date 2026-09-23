//
//  SegmentedGaugeDemoType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

enum SegmentedGaugeDemoType: CaseIterable {
    case veryHigh
    case high
    case medium
    case low
    case veryLow
    case noData
    case custom

    // MARK: - Properties

    static let `default`: Self = {
        switch SegmentedGaugeType.default {
        case .veryHigh: .veryHigh
        case .high: .high
        case .medium: .medium
        case .low: .low
        case .veryLow: .veryLow
        case .noData: .noData
        case .custom: .custom
        }
    }()

    // MARK: - Methods

    func toRealType(_ configuration: SegmentedGaugeConfiguration) -> SegmentedGaugeType {
        switch self {
        case .veryHigh: .veryHigh
        case .high: .high
        case .medium: .medium
        case .low: .low
        case .veryLow: .veryLow
        case .noData: .noData
        case .custom: .custom(
            level: configuration.typeCustomLevel,
            colorToken: configuration.typeCustomColorToken.value(configuration),
            dim: CGFloat(configuration.typeCustomOpacity) / 100
        )
        }
    }
}
