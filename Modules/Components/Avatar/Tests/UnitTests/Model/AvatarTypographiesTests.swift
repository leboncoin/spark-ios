//
//  AvatarTypographiesTests.swift
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

struct AvatarTypographiesTests {

    // MARK: - Tests

    @Test
    func defaultInitializationShouldHaveExpectedValues() {
        // GIVEN / WHEN
        let typographies = AvatarTypographies()

        // THEN
        #expect(typographies.placeholderFontToken.equals(TypographyFontTokenClear()))
    }

    @Test
    func equalityShouldReturnTrueWhenSameValues() {
        // GIVEN
        let fontToken = TypographyFontTokenGeneratedMock.body()

        let typographies1 = AvatarTypographies(
            placeholderFontToken: fontToken
        )

        let typographies2 = AvatarTypographies(
            placeholderFontToken: fontToken
        )

        // THEN
        #expect(typographies1 == typographies2)
    }

    @Test
    func equalityShouldReturnFalseWhenDifferentValues() {
        // GIVEN
        let fontToken1 = TypographyFontTokenGeneratedMock.body()
        let fontToken2 = TypographyFontTokenGeneratedMock.callout()

        let typographies1 = AvatarTypographies(
            placeholderFontToken: fontToken1
        )

        let typographies2 = AvatarTypographies(
            placeholderFontToken: fontToken2
        )

        // THEN
        #expect(typographies1 != typographies2)
    }
}
