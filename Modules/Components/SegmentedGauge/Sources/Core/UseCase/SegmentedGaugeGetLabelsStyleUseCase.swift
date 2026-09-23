//
//  SegmentedGaugeGetLabelsStyleUseCase.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedGaugeGetLabelsStyleUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> SegmentedGaugeLabelsStyle
}

final class SegmentedGaugeGetLabelsStyleUseCase: SegmentedGaugeGetLabelsStyleUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> SegmentedGaugeLabelsStyle {
        let typography = theme.typography
        let baseColors = theme.colors.base

        return SegmentedGaugeLabelsStyle(
            titleTypography: typography.subhead,
            descriptionTypography: typography.body2,
            color: baseColors.onSurface
        )
    }
}
