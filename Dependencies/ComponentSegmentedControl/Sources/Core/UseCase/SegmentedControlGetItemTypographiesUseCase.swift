//
//  SegmentedControlGetItemTypographiesUseCase.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedControlGetItemTypographiesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, isSelected: Bool) -> SegmentedControlItemTypographies
}

struct SegmentedControlGetItemTypographiesUseCase: SegmentedControlGetItemTypographiesUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, isSelected: Bool) -> SegmentedControlItemTypographies {
        let typography = theme.typography

        let textFontToken = isSelected ? typography.body1Highlight : typography.body1

        return .init(textFontToken: textFontToken)
    }
}
