//
//  ChipGetColorsUseCaseTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct ChipGetColorsUseCaseTests {

    // MARK: - Properties

    private let sut = ChipGetColorsUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute should return colors from token", arguments: ChipVariant.allCases, [true, false])
    func executeShouldReturnColorsFromToken(variant: ChipVariant, isSelected: Bool) {
        let token = ChipToken.Colors(theme: self.theme)

        for intent in ChipIntent.allCases {
            for isPressed in [true, false] {
                // GIVEN
                let expectedColors = ChipColors(
                    background: token.background(
                        intent: intent,
                        variant: variant,
                        isSelected: isSelected,
                        isPressed: isPressed
                    ),
                    border: token.border(
                        intent: intent,
                        variant: variant,
                        isSelected: isSelected,
                        isPressed: isPressed
                    ),
                    content: token.content(
                        intent: intent,
                        variant: variant,
                        isSelected: isSelected,
                        isPressed: isPressed
                    )
                )

                // WHEN
                let result = self.sut.execute(
                    theme: self.theme,
                    intent: intent,
                    variant: variant,
                    isSelected: isSelected,
                    isPressed: isPressed
                )

                // THEN
                #expect(result == expectedColors)
            }
        }
    }
}
