//
//  FileUploadDropzoneFontsTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("FileUploadDropzone Fonts Tests")
struct FileUploadDropzoneFontsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let fonts = FileUploadDropzoneFonts()

        // THEN
        #expect(fonts.descriptionFontToken.equals(TypographyFontTokenClear()))
        #expect(fonts.additionalTextFontToken.equals(TypographyFontTokenClear()))
    }

    @Test("Equality when same fonts")
    func equalityWhenSameFonts() {
        // GIVEN / WHEN
        let descriptionFontToken = TypographyFontTokenGeneratedMock.footnote()
        let additionalTextFontToken = TypographyFontTokenGeneratedMock.callout()

        let fonts1 = FileUploadDropzoneFonts(
            descriptionFontToken: descriptionFontToken,
            additionalTextFontToken: additionalTextFontToken
        )

        let fonts2 = FileUploadDropzoneFonts(
            descriptionFontToken: descriptionFontToken,
            additionalTextFontToken: additionalTextFontToken
        )

        // THEN
        #expect(fonts1 == fonts2)
    }

    @Test("Inequality when different description font token")
    func inequalityWhenDifferentDescriptionFontToken() {
        // GIVEN / WHEN
        let descriptionFontToken1 = TypographyFontTokenGeneratedMock.footnote()
        let descriptionFontToken2 = TypographyFontTokenGeneratedMock.callout()
        let additionalTextFontToken = TypographyFontTokenGeneratedMock.headline()

        let fonts1 = FileUploadDropzoneFonts(
            descriptionFontToken: descriptionFontToken1,
            additionalTextFontToken: additionalTextFontToken
        )

        let fonts2 = FileUploadDropzoneFonts(
            descriptionFontToken: descriptionFontToken2,
            additionalTextFontToken: additionalTextFontToken
        )

        // THEN
        #expect(fonts1 != fonts2)
    }

    @Test("Inequality when different additional text font token")
    func inequalityWhenDifferentAdditionalTextFontToken() {
        // GIVEN / WHEN
        let descriptionFontToken = TypographyFontTokenGeneratedMock.footnote()
        let additionalTextFontToken1 = TypographyFontTokenGeneratedMock.callout()
        let additionalTextFontToken2 = TypographyFontTokenGeneratedMock.headline()

        let fonts1 = FileUploadDropzoneFonts(
            descriptionFontToken: descriptionFontToken,
            additionalTextFontToken: additionalTextFontToken1
        )

        let fonts2 = FileUploadDropzoneFonts(
            descriptionFontToken: descriptionFontToken,
            additionalTextFontToken: additionalTextFontToken2
        )

        // THEN
        #expect(fonts1 != fonts2)
    }
}
