//
//  CircularMeterGetTypographiesUseCase.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CircularMeterGetTypographiesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, size: CircularMeterSize) -> CircularMeterTypographies
}

struct CircularMeterGetTypographiesUseCase: CircularMeterGetTypographiesUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, size: CircularMeterSize) -> CircularMeterTypographies {
        let typography = theme.typography

        return switch size {
        case .small:
                .init(
                    valueFontToken: typography.body2Highlight,
                    contentFontToken: typography.small
                )

        case .medium:
                .init(
                    valueFontToken: typography.body2Highlight,
                    contentFontToken: typography.small
                )

        case .large:
                .init(
                    valueFontToken: typography.body1Highlight,
                    contentFontToken: typography.caption
                )

        case .xLarge:
                .init(
                    valueFontToken: typography.display3,
                    contentFontToken: typography.body2
                )
        }
    }
}
