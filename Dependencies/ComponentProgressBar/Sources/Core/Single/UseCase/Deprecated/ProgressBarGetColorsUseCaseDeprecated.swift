//
//  ProgressBarGetColorUseCase.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 20/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
@available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
protocol ProgressBarMainGetColorsUseCaseable {
    associatedtype Intent: Equatable
    associatedtype Return: Equatable

    // sourcery: colors = "Identical", dims = "Identical"
    func execute(intent: Intent,
                 colors: any Colors,
                 dims: any Dims) -> Return
}

@available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
struct ProgressBarGetColorsUseCaseDeprecated: ProgressBarMainGetColorsUseCaseable {

    // MARK: - Methods

    func execute(
        intent: ProgressBarIntent,
        colors: any Colors,
        dims: any Dims
    ) -> ProgressBarColorsDeprecated {
        let indicatorBackgroundColorToken: any ColorToken
        switch intent {
        case .accent:
            indicatorBackgroundColorToken = colors.accent.accent
        case .alert:
            indicatorBackgroundColorToken = colors.feedback.alert
        case .danger:
            indicatorBackgroundColorToken = colors.feedback.error
        case .info:
            indicatorBackgroundColorToken = colors.feedback.info
        case .main:
            indicatorBackgroundColorToken = colors.main.main
        case .neutral:
            indicatorBackgroundColorToken = colors.feedback.neutral
        case .success:
            indicatorBackgroundColorToken = colors.feedback.success
        case .support:
            indicatorBackgroundColorToken = colors.support.support
        }

        return .init(
            trackBackgroundColorToken: colors.base.onBackground.opacity(dims.dim4),
            indicatorBackgroundColorToken: indicatorBackgroundColorToken
        )
    }
}
