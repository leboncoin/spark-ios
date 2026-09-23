//
//  SnackbarTypographiesTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 13/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSnackbar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Snackbar Typographies Tests")
struct SnackbarTypographiesTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let typographies = SnackbarTypographies()

        // THEN
        #expect(typographies.titleFontToken.equals(TypographyFontTokenClear()))
        #expect(typographies.descriptionFontToken.equals(TypographyFontTokenClear()))
    }

    @Test("Equality when same typographies")
    func equalityWhenSameTypographies() {
        // GIVEN / WHEN
        let titleFontToken = TypographyFontTokenGeneratedMock.caption()
        let descriptionFontToken = TypographyFontTokenGeneratedMock.body()

        let typographies1 = SnackbarTypographies(
            titleFontToken: titleFontToken,
            descriptionFontToken: descriptionFontToken
        )

        let typographies2 = SnackbarTypographies(
            titleFontToken: titleFontToken,
            descriptionFontToken: descriptionFontToken
        )

        // THEN
        #expect(typographies1 == typographies2)
    }

    @Test("Inequality when different title font token")
    func inequalityWhenDifferentTitleFontToken() {
        // GIVEN / WHEN
        let titleFontToken1 = TypographyFontTokenGeneratedMock.caption()
        let titleFontToken2 = TypographyFontTokenGeneratedMock.body()
        let descriptionFontToken = TypographyFontTokenGeneratedMock.footnote()

        let typographies1 = SnackbarTypographies(
            titleFontToken: titleFontToken1,
            descriptionFontToken: descriptionFontToken
        )

        let typographies2 = SnackbarTypographies(
            titleFontToken: titleFontToken2,
            descriptionFontToken: descriptionFontToken
        )

        // THEN
        #expect(typographies1 != typographies2)
    }

    @Test("Inequality when different description font token")
    func inequalityWhenDifferentDescriptionFontToken() {
        // GIVEN / WHEN
        let titleFontToken = TypographyFontTokenGeneratedMock.caption()
        let descriptionFontToken1 = TypographyFontTokenGeneratedMock.body()
        let descriptionFontToken2 = TypographyFontTokenGeneratedMock.footnote()

        let typographies1 = SnackbarTypographies(
            titleFontToken: titleFontToken,
            descriptionFontToken: descriptionFontToken1
        )

        let typographies2 = SnackbarTypographies(
            titleFontToken: titleFontToken,
            descriptionFontToken: descriptionFontToken2
        )

        // THEN
        #expect(typographies1 != typographies2)
    }
}
