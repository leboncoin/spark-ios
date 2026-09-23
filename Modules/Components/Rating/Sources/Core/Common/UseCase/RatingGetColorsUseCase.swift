//
//  RatingGetColorsUseCase.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol RatingGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> RatingColors
}

struct RatingGetColorsUseCase: RatingGetColorsUseCaseable {

    func execute(theme: any Theme) -> RatingColors {
        let colors = theme.colors

        return .init(
            filledStarTintColorToken: colors.main.mainVariant,
            strokeStarTintColorToken: colors.base.onSurface.opacity(theme.dims.dim3)
        )
    }
}
