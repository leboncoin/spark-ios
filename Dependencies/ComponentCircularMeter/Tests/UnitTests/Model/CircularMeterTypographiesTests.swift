//
//  CircularMeterTypographiesTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCircularMeter
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Circular Meter Typographies Tests")
struct CircularMeterTypographiesTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let typographies = CircularMeterTypographies()

        // THEN
        #expect(typographies.valueFontToken.equals(TypographyFontTokenClear()))
        #expect(typographies.contentFontToken.equals(TypographyFontTokenClear()))
    }

    @Test("Equality when same typographies")
    func equalityWhenSameTypographies() {
        // GIVEN / WHEN
        let valueFontToken = TypographyFontTokenGeneratedMock.body()
        let contentFontToken = TypographyFontTokenGeneratedMock.callout()

        let typographies1 = CircularMeterTypographies(
            valueFontToken: valueFontToken,
            contentFontToken: contentFontToken
        )

        let typographies2 = CircularMeterTypographies(
            valueFontToken: valueFontToken,
            contentFontToken: contentFontToken
        )

        // THEN
        #expect(typographies1 == typographies2)
    }

    @Test("Inequality when different inside value font token")
    func inequalityWhenDifferentInsideValueFontToken() {
        // GIVEN / WHEN
        let valueFontToken1 = TypographyFontTokenGeneratedMock.body()
        let valueFontToken2 = TypographyFontTokenGeneratedMock.callout()
        let contentFontToken = TypographyFontTokenGeneratedMock.headline()

        let typographies1 = CircularMeterTypographies(
            valueFontToken: valueFontToken1,
            contentFontToken: contentFontToken
        )

        let typographies2 = CircularMeterTypographies(
            valueFontToken: valueFontToken2,
            contentFontToken: contentFontToken
        )

        // THEN
        #expect(typographies1 != typographies2)
    }

    @Test("Inequality when different inside content font token")
    func inequalityWhenDifferentInsideContentFontToken() {
        // GIVEN / WHEN
        let valueFontToken = TypographyFontTokenGeneratedMock.body()
        let contentFontToken1 = TypographyFontTokenGeneratedMock.callout()
        let contentFontToken2 = TypographyFontTokenGeneratedMock.footnote()

        let typographies1 = CircularMeterTypographies(
            valueFontToken: valueFontToken,
            contentFontToken: contentFontToken1
        )

        let typographies2 = CircularMeterTypographies(
            valueFontToken: valueFontToken,
            contentFontToken: contentFontToken2
        )

        // THEN
        #expect(typographies1 != typographies2)
    }
}
