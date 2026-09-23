//
//  SliderGetColorsUseCase.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SliderGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, intent: SliderIntent) -> SliderColors
}

struct SliderGetColorsUseCase: SliderGetColorsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, intent: SliderIntent) -> SliderColors {
        let colors = theme.colors
        let dims = theme.dims

        let tintColorToken: any ColorToken = switch intent {
        case .accent: colors.accent.accent
        case .main: colors.main.main
        case .support: colors.support.support

            // Deprecated cases
        case .alert: colors.feedback.alert
        case .error: colors.feedback.error
        case .info: colors.feedback.info
        case .neutral: colors.feedback.neutral
        case .success: colors.feedback.success
        }

        let textColorToken = colors.base.onSurface

        return SliderColors(
            tintColorToken: tintColorToken,
            titleColorToken: textColorToken,
            valueColorToken: textColorToken,
            rangeValuesColorToken: textColorToken.opacity(dims.dim1)
        )
    }
}
