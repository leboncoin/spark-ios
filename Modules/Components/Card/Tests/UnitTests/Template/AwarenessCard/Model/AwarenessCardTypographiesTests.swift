//
//  AwarenessCardTypographiesTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

// MARK: - Tests

@Suite("AwarenessCardTypographies Tests")
struct AwarenessCardTypographiesTests {

    // MARK: - Tests

    @Test("Default initialization with clear tokens")
    func testInitialization() {
        // GIVEN / WHEN
        let typographies = AwarenessCardTypographies()

        // THEN
        #expect(typographies.titleFontToken is TypographyFontTokenClear)
        #expect(typographies.descriptionFontToken is TypographyFontTokenClear)
    }

    @Test("Custom initialization with specific tokens")
    func testCustomInitialization() {
        // GIVEN
        let titleFontToken = TypographyFontTokenGeneratedMock.body()
        let descriptionFontToken = TypographyFontTokenGeneratedMock.callout()

        // WHEN
        let typographies = AwarenessCardTypographies(
            titleFontToken: titleFontToken,
            descriptionFontToken: descriptionFontToken
        )

        // THEN
        #expect(typographies.titleFontToken.font == titleFontToken.font)
        #expect(typographies.titleFontToken.uiFont == titleFontToken.uiFont)
        #expect(typographies.descriptionFontToken.font == descriptionFontToken.font)
        #expect(typographies.descriptionFontToken.uiFont == descriptionFontToken.uiFont)
    }

    @Test("Equatable conformance")
    func testEquatable() {
        // GIVEN
        let titleFontToken1 = TypographyFontTokenGeneratedMock.body()
        let titleFontToken2 = TypographyFontTokenGeneratedMock.body()
        let differentTitleFontToken = TypographyFontTokenGeneratedMock.callout()

        let descriptionFontToken1 = TypographyFontTokenGeneratedMock.caption()
        let descriptionFontToken2 = TypographyFontTokenGeneratedMock.caption()
        let differentDescriptionFontToken = TypographyFontTokenGeneratedMock.headline()

        let typographies1 = AwarenessCardTypographies(
            titleFontToken: titleFontToken1,
            descriptionFontToken: descriptionFontToken1
        )
        let typographies2 = AwarenessCardTypographies(
            titleFontToken: titleFontToken2,
            descriptionFontToken: descriptionFontToken2
        )
        let typographies3 = AwarenessCardTypographies(
            titleFontToken: differentTitleFontToken,
            descriptionFontToken: descriptionFontToken1
        )
        let typographies4 = AwarenessCardTypographies(
            titleFontToken: titleFontToken1,
            descriptionFontToken: differentDescriptionFontToken
        )

        // WHEN / THEN
        #expect(typographies1 == typographies2)
        #expect(typographies1 != typographies3)
        #expect(typographies1 != typographies4)
    }

    @Test("Property mutation updates values correctly")
    func testPropertyMutation() {
        // GIVEN
        var typographies = AwarenessCardTypographies()
        let newTitleFontToken = TypographyFontTokenGeneratedMock.body()
        let newDescriptionFontToken = TypographyFontTokenGeneratedMock.callout()

        // WHEN
        typographies.titleFontToken = newTitleFontToken
        typographies.descriptionFontToken = newDescriptionFontToken

        // THEN
        #expect(typographies.titleFontToken.font == newTitleFontToken.font)
        #expect(typographies.titleFontToken.uiFont == newTitleFontToken.uiFont)
        #expect(typographies.descriptionFontToken.font == newDescriptionFontToken.font)
        #expect(typographies.descriptionFontToken.uiFont == newDescriptionFontToken.uiFont)
    }
}
