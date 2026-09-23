//
//  SegmentedGaugeGetLayoutUseCase.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedGaugeGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, alignment: SegmentedGaugeAlignment) -> SegmentedGaugeLayout
}

final class SegmentedGaugeGetLayoutUseCase: SegmentedGaugeGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, alignment: SegmentedGaugeAlignment) -> SegmentedGaugeLayout {
        let smallSpacing = theme.layout.spacing.small
        let mediumSpacing = theme.layout.spacing.medium

        let subContentSpacing = switch alignment {
        case .horizontal: mediumSpacing
        case .vertical: smallSpacing
        }

        return .init(
            contentSpacing: smallSpacing,
            subContentSpacing: subContentSpacing,
            segmentsSpacing: smallSpacing
        )
    }
}
