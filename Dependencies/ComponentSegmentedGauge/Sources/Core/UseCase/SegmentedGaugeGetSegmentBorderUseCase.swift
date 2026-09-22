//
//  SegmentedGaugeGetSegmentBorderUseCase.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedGaugeGetSegmentBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> SegmentedGaugeSegmentBorder
}

final class SegmentedGaugeGetSegmentBorderUseCase: SegmentedGaugeGetSegmentBorderUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> SegmentedGaugeSegmentBorder {
        return .init(
            width: theme.border.width.small,
            radius: theme.border.radius.full
        )
    }
}
