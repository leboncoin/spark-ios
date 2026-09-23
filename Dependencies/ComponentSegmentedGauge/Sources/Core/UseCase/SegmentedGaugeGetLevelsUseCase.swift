//
//  SegmentedGaugeGetLevelsUseCase.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedGaugeGetLevelsUseCaseable {
    func execute(
        segments: SegmentedGaugeSegments,
        type: SegmentedGaugeType
    ) -> SegmentedGaugeLevels
}

final class SegmentedGaugeGetLevelsUseCase: SegmentedGaugeGetLevelsUseCaseable {

    // MARK: - Methods

    func execute(
        segments: SegmentedGaugeSegments,
        type: SegmentedGaugeType
    ) -> SegmentedGaugeLevels {
        let levels = switch segments {
        case .three: 3
        case .five: 5
        }

        let currentLevel = switch segments {
        case .three:
            switch type {
            case .veryHigh, .high, .medium: 3
            case .low: 2
            case .veryLow: 1
            case .noData: 0
            case .custom(let level, _, _): level.validated(for: levels)
            }

        case .five:
            switch type {
            case .veryHigh: 5
            case .high: 4
            case .medium: 3
            case .low: 2
            case .veryLow: 1
            case .noData: 0
            case .custom(let level, _, _): level.validated(for: levels)
            }
        }

        return .init(
            currentLevel: currentLevel,
            levels: levels
        )
    }
}

// MARK: - Extension

private extension Int {

    func validated(for levels: Self) -> Self {
        return if self > levels {
            levels
        } else if self < 0 {
            0
        } else {
            self
        }
    }
}
