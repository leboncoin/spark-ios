//
//  FileUploadPreviewColorsTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("FileUploadPreview Colors Tests")
struct FileUploadPreviewColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = FileUploadPreviewColors()

        // THEN
        #expect(colors.backgroundColorToken.equals(ColorTokenClear()))
        #expect(colors.borderColorToken.equals(ColorTokenClear()))
        #expect(colors.imageTintColorToken.equals(ColorTokenClear()))
        #expect(colors.imageBackgroundColorToken.equals(ColorTokenClear()))
        #expect(colors.nameTextColorToken.equals(ColorTokenClear()))
        #expect(colors.sizeTextColorToken.equals(ColorTokenClear()))
        #expect(colors.errorTextColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let imageTintColorToken = ColorTokenGeneratedMock.random()
        let imageBackgroundColorToken = ColorTokenGeneratedMock.random()
        let nameTextColorToken = ColorTokenGeneratedMock.random()
        let sizeTextColorToken = ColorTokenGeneratedMock.random()
        let errorTextColorToken = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )

        let colors2 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different background color token")
    func inequalityWhenDifferentBackgroundColorToken() {
        // GIVEN / WHEN
        let backgroundColorToken1 = ColorTokenGeneratedMock.random()
        let backgroundColorToken2 = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let imageTintColorToken = ColorTokenGeneratedMock.random()
        let imageBackgroundColorToken = ColorTokenGeneratedMock.random()
        let nameTextColorToken = ColorTokenGeneratedMock.random()
        let sizeTextColorToken = ColorTokenGeneratedMock.random()
        let errorTextColorToken = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken1,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )

        let colors2 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken2,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different border color token")
    func inequalityWhenDifferentBorderColorToken() {
        // GIVEN / WHEN
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken1 = ColorTokenGeneratedMock.random()
        let borderColorToken2 = ColorTokenGeneratedMock.random()
        let imageTintColorToken = ColorTokenGeneratedMock.random()
        let imageBackgroundColorToken = ColorTokenGeneratedMock.random()
        let nameTextColorToken = ColorTokenGeneratedMock.random()
        let sizeTextColorToken = ColorTokenGeneratedMock.random()
        let errorTextColorToken = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken1,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )

        let colors2 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken2,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different image tint color token")
    func inequalityWhenDifferentImageTintColorToken() {
        // GIVEN / WHEN
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let imageTintColorToken1 = ColorTokenGeneratedMock.random()
        let imageTintColorToken2 = ColorTokenGeneratedMock.random()
        let imageBackgroundColorToken = ColorTokenGeneratedMock.random()
        let nameTextColorToken = ColorTokenGeneratedMock.random()
        let sizeTextColorToken = ColorTokenGeneratedMock.random()
        let errorTextColorToken = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken1,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )

        let colors2 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken2,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different image background color token")
    func inequalityWhenDifferentImageBackgroundColorToken() {
        // GIVEN / WHEN
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let imageTintColorToken = ColorTokenGeneratedMock.random()
        let imageBackgroundColorToken1 = ColorTokenGeneratedMock.random()
        let imageBackgroundColorToken2 = ColorTokenGeneratedMock.random()
        let nameTextColorToken = ColorTokenGeneratedMock.random()
        let sizeTextColorToken = ColorTokenGeneratedMock.random()
        let errorTextColorToken = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken1,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )

        let colors2 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken2,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different name text color token")
    func inequalityWhenDifferentNameTextColorToken() {
        // GIVEN / WHEN
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let imageTintColorToken = ColorTokenGeneratedMock.random()
        let imageBackgroundColorToken = ColorTokenGeneratedMock.random()
        let nameTextColorToken1 = ColorTokenGeneratedMock.random()
        let nameTextColorToken2 = ColorTokenGeneratedMock.random()
        let sizeTextColorToken = ColorTokenGeneratedMock.random()
        let errorTextColorToken = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken1,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )

        let colors2 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken2,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different size text color token")
    func inequalityWhenDifferentSizeTextColorToken() {
        // GIVEN / WHEN
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let imageTintColorToken = ColorTokenGeneratedMock.random()
        let imageBackgroundColorToken = ColorTokenGeneratedMock.random()
        let nameTextColorToken = ColorTokenGeneratedMock.random()
        let sizeTextColorToken1 = ColorTokenGeneratedMock.random()
        let sizeTextColorToken2 = ColorTokenGeneratedMock.random()
        let errorTextColorToken = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken1,
            errorTextColorToken: errorTextColorToken
        )

        let colors2 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken2,
            errorTextColorToken: errorTextColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different error text color token")
    func inequalityWhenDifferentErrorTextColorToken() {
        // GIVEN / WHEN
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let imageTintColorToken = ColorTokenGeneratedMock.random()
        let imageBackgroundColorToken = ColorTokenGeneratedMock.random()
        let nameTextColorToken = ColorTokenGeneratedMock.random()
        let sizeTextColorToken = ColorTokenGeneratedMock.random()
        let errorTextColorToken1 = ColorTokenGeneratedMock.random()
        let errorTextColorToken2 = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken1
        )

        let colors2 = FileUploadPreviewColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            imageBackgroundColorToken: imageBackgroundColorToken,
            nameTextColorToken: nameTextColorToken,
            sizeTextColorToken: sizeTextColorToken,
            errorTextColorToken: errorTextColorToken2
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
