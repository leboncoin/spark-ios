//
//  FileUploadPreviewFontsTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("FileUploadPreview Fonts Tests")
struct FileUploadPreviewFontsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let fonts = FileUploadPreviewFonts()

        // THEN
        #expect(fonts.nameFontToken.equals(TypographyFontTokenClear()))
        #expect(fonts.sizeFontToken.equals(TypographyFontTokenClear()))
        #expect(fonts.errorFontToken.equals(TypographyFontTokenClear()))
    }

    @Test("Equality when same fonts")
    func equalityWhenSameFonts() {
        // GIVEN / WHEN
        let nameFontToken = TypographyFontTokenGeneratedMock.footnote()
        let sizeFontToken = TypographyFontTokenGeneratedMock.callout()
        let errorFontToken = TypographyFontTokenGeneratedMock.headline()

        let fonts1 = FileUploadPreviewFonts(
            nameFontToken: nameFontToken,
            sizeFontToken: sizeFontToken,
            errorFontToken: errorFontToken
        )

        let fonts2 = FileUploadPreviewFonts(
            nameFontToken: nameFontToken,
            sizeFontToken: sizeFontToken,
            errorFontToken: errorFontToken
        )

        // THEN
        #expect(fonts1 == fonts2)
    }

    @Test("Inequality when different name font token")
    func inequalityWhenDifferentNameFontToken() {
        // GIVEN / WHEN
        let nameFontToken1 = TypographyFontTokenGeneratedMock.footnote()
        let nameFontToken2 = TypographyFontTokenGeneratedMock.callout()
        let sizeFontToken = TypographyFontTokenGeneratedMock.headline()
        let errorFontToken = TypographyFontTokenGeneratedMock.title()

        let fonts1 = FileUploadPreviewFonts(
            nameFontToken: nameFontToken1,
            sizeFontToken: sizeFontToken,
            errorFontToken: errorFontToken
        )

        let fonts2 = FileUploadPreviewFonts(
            nameFontToken: nameFontToken2,
            sizeFontToken: sizeFontToken,
            errorFontToken: errorFontToken
        )

        // THEN
        #expect(fonts1 != fonts2)
    }

    @Test("Inequality when different size font token")
    func inequalityWhenDifferentSizeFontToken() {
        // GIVEN / WHEN
        let nameFontToken = TypographyFontTokenGeneratedMock.footnote()
        let sizeFontToken1 = TypographyFontTokenGeneratedMock.callout()
        let sizeFontToken2 = TypographyFontTokenGeneratedMock.headline()
        let errorFontToken = TypographyFontTokenGeneratedMock.title()

        let fonts1 = FileUploadPreviewFonts(
            nameFontToken: nameFontToken,
            sizeFontToken: sizeFontToken1,
            errorFontToken: errorFontToken
        )

        let fonts2 = FileUploadPreviewFonts(
            nameFontToken: nameFontToken,
            sizeFontToken: sizeFontToken2,
            errorFontToken: errorFontToken
        )

        // THEN
        #expect(fonts1 != fonts2)
    }

    @Test("Inequality when different error font token")
    func inequalityWhenDifferentErrorFontToken() {
        // GIVEN / WHEN
        let nameFontToken = TypographyFontTokenGeneratedMock.footnote()
        let sizeFontToken = TypographyFontTokenGeneratedMock.callout()
        let errorFontToken1 = TypographyFontTokenGeneratedMock.headline()
        let errorFontToken2 = TypographyFontTokenGeneratedMock.title()

        let fonts1 = FileUploadPreviewFonts(
            nameFontToken: nameFontToken,
            sizeFontToken: sizeFontToken,
            errorFontToken: errorFontToken1
        )

        let fonts2 = FileUploadPreviewFonts(
            nameFontToken: nameFontToken,
            sizeFontToken: sizeFontToken,
            errorFontToken: errorFontToken2
        )

        // THEN
        #expect(fonts1 != fonts2)
    }
}
