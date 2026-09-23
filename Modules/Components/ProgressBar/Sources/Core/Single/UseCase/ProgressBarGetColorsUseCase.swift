//
//  ProgressBarGetColorsUseCase.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ProgressBarGetColorsUseCaseable {

    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: ProgressBarIntent
    ) -> ProgressBarColors
}

struct ProgressBarGetColorsUseCase: ProgressBarGetColorsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: ProgressBarIntent
    ) -> ProgressBarColors {
        let colors = theme.colors

        let indicatorBackgroundColorToken = switch intent {
        case .accent: colors.accent.accent
        case .alert: colors.feedback.alert
        case .danger: colors.feedback.error
        case .info: colors.feedback.info
        case .main: colors.main.main
        case .neutral: colors.feedback.neutral
        case .success: colors.feedback.success
        case .support: colors.support.support
        }

        return .init(
            trackBackgroundColorToken: colors.base.onBackground.opacity(theme.dims.dim4),
            indicatorBackgroundColorToken: indicatorBackgroundColorToken
        )
    }
}
