//
//  SegmentedControlGetItemColorsUseCase.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SegmentedControlGetItemColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, isPressed: Bool, isSelected: Bool) -> SegmentedControlItemColors
}

struct SegmentedControlGetItemColorsUseCase: SegmentedControlGetItemColorsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, isPressed: Bool, isSelected: Bool) -> SegmentedControlItemColors {
        let colors = theme.colors

        let backgroundColorToken = switch (isSelected, isPressed) {
        case (false, true): colors.states.supportContainerPressed
        default: ColorTokenClear()
        }

        return .init(
            backgroundColorToken: backgroundColorToken,
            contentColorToken: colors.support.onSupportContainer
        )
    }
}
