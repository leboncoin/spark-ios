//
//  CircularMeterGetColorsUseCase.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CircularMeterGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, intent: CircularMeterIntent) -> CircularMeterColors
}

struct CircularMeterGetColorsUseCase: CircularMeterGetColorsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, intent: CircularMeterIntent) -> CircularMeterColors {
        let colors = theme.colors
        let dims = theme.dims

        let indicatorColorToken: any ColorToken = switch intent {
        case .alert: colors.feedback.alert
        case .error: colors.feedback.error
        case .info: colors.feedback.info
        case .main: colors.main.main
        case .success: colors.feedback.success
        case .support: colors.support.support
        }

        let iconColorToken = colors.feedback.neutral
        let valueColorToken = colors.base.onSurface
        let contentColorToken = colors.base.onSurface.opacity(dims.dim1)

        return CircularMeterColors(
            trackColorToken: indicatorColorToken.opacity(dims.dim4),
            indicatorColorToken: indicatorColorToken,
            iconColorToken: iconColorToken,
            valueColorToken: valueColorToken,
            contentColorToken: contentColorToken
        )
    }
}
