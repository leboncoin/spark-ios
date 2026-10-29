//
//  RatingColorsTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Rating Colors Tests")
struct RatingColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = RatingColors()

        // THEN
        #expect(colors.filledStarTintColorToken.equals(ColorTokenClear()))
        #expect(colors.strokeStarTintColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let filledStarToken = ColorTokenGeneratedMock.random()
        let emptyStarToken = ColorTokenGeneratedMock.random()

        let colors1 = RatingColors(
            filledStarTintColorToken: filledStarToken,
            strokeStarTintColorToken: emptyStarToken
        )

        let colors2 = RatingColors(
            filledStarTintColorToken: filledStarToken,
            strokeStarTintColorToken: emptyStarToken
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different filled star colors")
    func inequalityWhenDifferentFilledStarColors() {
        // GIVEN / WHEN
        let filledStarToken1 = ColorTokenGeneratedMock.random()
        let filledStarToken2 = ColorTokenGeneratedMock.random()
        let emptyStarToken = ColorTokenGeneratedMock.random()

        let colors1 = RatingColors(
            filledStarTintColorToken: filledStarToken1,
            strokeStarTintColorToken: emptyStarToken
        )

        let colors2 = RatingColors(
            filledStarTintColorToken: filledStarToken2,
            strokeStarTintColorToken: emptyStarToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different empty star colors")
    func inequalityWhenDifferentEmptyStarColors() {
        // GIVEN / WHEN
        let filledStarToken = ColorTokenGeneratedMock.random()
        let emptyStarToken1 = ColorTokenGeneratedMock.random()
        let emptyStarToken2 = ColorTokenGeneratedMock.random()

        let colors1 = RatingColors(
            filledStarTintColorToken: filledStarToken,
            strokeStarTintColorToken: emptyStarToken1
        )

        let colors2 = RatingColors(
            filledStarTintColorToken: filledStarToken,
            strokeStarTintColorToken: emptyStarToken2
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
