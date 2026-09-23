//
//  AvatarColorsTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentAvatar

// MARK: - Tests

struct AvatarColorsTests {

    // MARK: - Tests

    @Test
    func defaultInitializationShouldHaveExpectedValues() {
        // GIVEN / WHEN
        let colors = AvatarColors()

        // THEN
        #expect(colors.backgroundColorToken.equals(ColorTokenClear()))
        #expect(colors.borderColorToken.equals(ColorTokenClear()))
        #expect(colors.placeholderTintColorToken.equals(ColorTokenClear()))
        #expect(colors.actionBackgroundColorToken.equals(ColorTokenClear()))
        #expect(colors.actionTintColorToken.equals(ColorTokenClear()))
    }

    @Test
    func equalityShouldReturnTrueWhenSameValues() {
        // GIVEN
        let colorToken = ColorTokenGeneratedMock.random()

        let colors1 = AvatarColors(
            backgroundColorToken: colorToken,
            borderColorToken: colorToken,
            placeholderTintColorToken: colorToken,
            actionBackgroundColorToken: colorToken,
            actionTintColorToken: colorToken
        )

        let colors2 = AvatarColors(
            backgroundColorToken: colorToken,
            borderColorToken: colorToken,
            placeholderTintColorToken: colorToken,
            actionBackgroundColorToken: colorToken,
            actionTintColorToken: colorToken
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test
    func equalityShouldReturnFalseWhenDifferentValues() {
        // GIVEN
        let colorToken1 = ColorTokenGeneratedMock.random()
        let colorToken2 = ColorTokenGeneratedMock.random()

        let colors1 = AvatarColors(
            backgroundColorToken: colorToken1,
            borderColorToken: colorToken1,
            placeholderTintColorToken: colorToken1,
            actionBackgroundColorToken: colorToken1,
            actionTintColorToken: colorToken1
        )

        let colors2 = AvatarColors(
            backgroundColorToken: colorToken2,
            borderColorToken: colorToken2,
            placeholderTintColorToken: colorToken2,
            actionBackgroundColorToken: colorToken2,
            actionTintColorToken: colorToken2
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
