//
//  CardTypographiesTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 12/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

// MARK: - Tests

@Suite("Card Typographies Tests")
struct CardTypographiesTests {

    @Test("Default initialization with clear font token")
    func defaultInitialization() {
        // GIVEN / WHEN
        let typographies = CardTypographies()

        // THEN
        #expect(typographies.headerFontToken is TypographyFontTokenClear)
    }

    @Test("Custom initialization with specific font token")
    func customInitialization() {
        // GIVEN
        let fontToken = TypographyFontTokenGeneratedMock.body()

        // WHEN
        let typographies = CardTypographies(headerFontToken: fontToken)

        // THEN
        #expect(typographies.headerFontToken.font == fontToken.font)
        #expect(typographies.headerFontToken.uiFont == fontToken.uiFont)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN
        let fontToken1 = TypographyFontTokenGeneratedMock.body()
        let fontToken2 = TypographyFontTokenGeneratedMock.body()

        let typographies1 = CardTypographies(headerFontToken: fontToken1)
        let typographies2 = CardTypographies(headerFontToken: fontToken2)

        // WHEN / THEN
        #expect(typographies1 == typographies2)
    }

    @Test("Inequality when different font token")
    func inequalityWhenDifferentFontToken() {
        // GIVEN
        let fontToken1 = TypographyFontTokenGeneratedMock.body()
        let differentFontToken = TypographyFontTokenGeneratedMock.callout()

        let typographies1 = CardTypographies(headerFontToken: fontToken1)
        let typographies3 = CardTypographies(headerFontToken: differentFontToken)

        // WHEN / THEN
        #expect(typographies1 != typographies3)
    }

    @Test("Property mutation")
    func propertyMutation() {
        // GIVEN
        var typographies = CardTypographies()
        let newFontToken = TypographyFontTokenGeneratedMock.body()

        // WHEN
        typographies.headerFontToken = newFontToken

        // THEN
        #expect(typographies.headerFontToken.font == newFontToken.font)
        #expect(typographies.headerFontToken.uiFont == newFontToken.uiFont)
    }
}
