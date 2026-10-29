//
//  RatingDisplayTextStyleTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 14/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Rating Display Text Style Tests")
struct RatingDisplayTextStyleTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let textStyle = RatingDisplayTextStyle()

        // THEN
        #expect(textStyle.fontToken.equals(TypographyFontTokenClear()))
        #expect(textStyle.colorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same properties")
    func equalityWhenSameProperties() {
        // GIVEN / WHEN
        let fontToken = TypographyFontTokenGeneratedMock.mocked()
        let colorToken = ColorTokenGeneratedMock.random()

        let textStyle1 = RatingDisplayTextStyle(
            fontToken: fontToken,
            colorToken: colorToken
        )

        let textStyle2 = RatingDisplayTextStyle(
            fontToken: fontToken,
            colorToken: colorToken
        )

        // THEN
        #expect(textStyle1 == textStyle2)
    }

    @Test("Inequality when different font token")
    func inequalityWhenDifferentFontToken() {
        // GIVEN / WHEN
        let fontToken1 = TypographyFontTokenGeneratedMock.mocked()
        let fontToken2 = TypographyFontTokenGeneratedMock.mocked(.title)
        let colorToken = ColorTokenGeneratedMock.random()

        let textStyle1 = RatingDisplayTextStyle(
            fontToken: fontToken1,
            colorToken: colorToken
        )

        let textStyle2 = RatingDisplayTextStyle(
            fontToken: fontToken2,
            colorToken: colorToken
        )

        // THEN
        #expect(textStyle1 != textStyle2)
    }

    @Test("Inequality when different color token")
    func inequalityWhenDifferentColorToken() {
        // GIVEN / WHEN
        let fontToken = TypographyFontTokenGeneratedMock.mocked()
        let colorToken1 = ColorTokenGeneratedMock.random()
        let colorToken2 = ColorTokenGeneratedMock.random()

        let textStyle1 = RatingDisplayTextStyle(
            fontToken: fontToken,
            colorToken: colorToken1
        )

        let textStyle2 = RatingDisplayTextStyle(
            fontToken: fontToken,
            colorToken: colorToken2
        )

        // THEN
        #expect(textStyle1 != textStyle2)
    }

    @Test("Hash consistency")
    func hashConsistency() {
        // GIVEN
        let fontToken = TypographyFontTokenGeneratedMock.mocked()
        let colorToken = ColorTokenGeneratedMock.random()

        let textStyle1 = RatingDisplayTextStyle(
            fontToken: fontToken,
            colorToken: colorToken
        )

        let textStyle2 = RatingDisplayTextStyle(
            fontToken: fontToken,
            colorToken: colorToken
        )

        // WHEN
        var hasher1 = Hasher()
        textStyle1.hash(into: &hasher1)
        let hash1 = hasher1.finalize()

        var hasher2 = Hasher()
        textStyle2.hash(into: &hasher2)
        let hash2 = hasher2.finalize()

        // THEN
        #expect(hash1 == hash2)
    }
}
