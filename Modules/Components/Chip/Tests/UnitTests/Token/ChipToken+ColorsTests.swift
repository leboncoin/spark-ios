//
//  ChipToken+ColorsTests.swift
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

struct ChipTokenColorsTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: ChipToken.Colors {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Colors with dashed variant should return outlined colors", arguments: ChipIntent.allCases)
    func colorsWithDashedVariantShouldReturnOutlinedColors(intent: ChipIntent) {
        for isSelected in [true, false] {
            for isPressed in [true, false] {
                // GIVEN / WHEN
                let dashedBackground = self.token.background(
                    intent: intent,
                    variant: .dashed,
                    isSelected: isSelected,
                    isPressed: isPressed
                )
                let dashedBorder = self.token.border(
                    intent: intent,
                    variant: .dashed,
                    isSelected: isSelected,
                    isPressed: isPressed
                )
                let dashedContent = self.token.content(
                    intent: intent,
                    variant: .dashed,
                    isSelected: isSelected,
                    isPressed: isPressed
                )

                // THEN
                #expect(dashedBackground.equals(self.token.background(
                    intent: intent,
                    variant: .outlined,
                    isSelected: isSelected,
                    isPressed: isPressed
                )))
                #expect(dashedBorder.equals(self.token.border(
                    intent: intent,
                    variant: .outlined,
                    isSelected: isSelected,
                    isPressed: isPressed
                )))
                #expect(dashedContent.equals(self.token.content(
                    intent: intent,
                    variant: .outlined,
                    isSelected: isSelected,
                    isPressed: isPressed
                )))
            }
        }
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = ChipToken.Colors(theme: self.theme)
        let rhs = ChipToken.Colors(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = ChipToken.Colors(theme: self.theme)
        let rhs = ChipToken.Colors(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
