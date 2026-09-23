//
//  SliderGetTypographiesUseCase.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SliderGetTypographiesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        isFloatingValueLabel: Bool
    ) -> SliderTypographies
}

struct SliderGetTypographiesUseCase: SliderGetTypographiesUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        isFloatingValueLabel: Bool
    ) -> SliderTypographies {
        let typography = theme.typography

        return SliderTypographies(
            titleFontToken: isFloatingValueLabel ? typography.body1Highlight : typography.body1,
            valueFontToken: isFloatingValueLabel ? typography.body2Highlight : typography.body1Highlight,
            rangeValuesFontToken: typography.body2
        )
    }
}
