//
//  SegmentedControlGetBorderUseCase.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedControlGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> SegmentedControlBorder
}

struct SegmentedControlGetBorderUseCase: SegmentedControlGetBorderUseCaseable {

    // MARK: - Properties

    private let getLayoutUseCase: SegmentedControlGetLayoutUseCaseable

    // MARK: - Initialization

    init(getLayoutUseCase: SegmentedControlGetLayoutUseCaseable = SegmentedControlGetLayoutUseCase()) {
        self.getLayoutUseCase = getLayoutUseCase
    }

    // MARK: - Methods

    func execute(theme: any Theme) -> SegmentedControlBorder {
        let borderWidth = theme.border.width.small

        let layout = self.getLayoutUseCase.execute(theme: theme)

        let radius = SegmentedControlConstants.minHeight / 2

        return .init(
            radius: radius,
            width: borderWidth,
            selectedItemRadius: radius - layout.padding,
            selectedItemWidth: borderWidth
        )
    }
}
