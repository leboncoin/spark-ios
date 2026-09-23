//
//  SegmentedControlGetColorsUseCase.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedControlGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> SegmentedControlColors
}

struct SegmentedControlGetColorsUseCase: SegmentedControlGetColorsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> SegmentedControlColors {
        let colors = theme.colors
        let dims = theme.dims

        return .init(
            backgroundColorToken: colors.base.surface,
            borderColorToken: colors.base.outline,
            separatorColorToken: colors.base.outline.opacity(dims.dim3),
            selectedItemBackgroundColorToken: colors.support.supportContainer,
            selectedItemBorderColorToken: colors.support.support,
            accessibilitySelectedTintColorToken: colors.support.onSupport,
            accessibilitySelectedBackgroundColorToken: colors.support.support
        )
    }
}
