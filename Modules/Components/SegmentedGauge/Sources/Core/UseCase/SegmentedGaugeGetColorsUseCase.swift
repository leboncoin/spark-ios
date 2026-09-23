//
//  SegmentedGaugeGetColorsUseCase.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedGaugeGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        type: SegmentedGaugeType,
        segments: SegmentedGaugeSegments
    ) -> SegmentedGaugeColors
}

final class SegmentedGaugeGetColorsUseCase: SegmentedGaugeGetColorsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        type: SegmentedGaugeType,
        segments: SegmentedGaugeSegments
    ) -> SegmentedGaugeColors {
        let surfaceColor = theme.colors.base.surface
        let feedbackColors = theme.colors.feedback

        let color = switch type {
        case .veryHigh, .high: feedbackColors.success
        case .medium: switch segments {
        case .three: feedbackColors.success
        case .five: feedbackColors.neutral
        }
        case .low: feedbackColors.alert
        case .veryLow: feedbackColors.error
        case .noData: surfaceColor
        case .custom(_, let colorToken, _): colorToken
        }

        let opacity = switch type {
        case .custom(_, _, let dim) where dim > 0: dim
        default: 1.0
        }

        return .init(
            plainSegmentBackground: color,
            otherSegmentBackground: surfaceColor,
            plainSegmentBorder: color,
            otherSegmentBorder: theme.colors.base.outline,
            markerOuterBackground: color,
            markerInnerBackground: surfaceColor,
            plainSegmentOpacity: opacity
        )
    }
}
