//
//  FileUploadDropzoneColorsTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 02/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("FileUploadDropzone Colors Tests")
struct FileUploadDropzoneColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = FileUploadDropzoneColors()

        // THEN
        #expect(colors.backgroundColorToken.equals(ColorTokenClear()))
        #expect(colors.borderColorToken.equals(ColorTokenClear()))
        #expect(colors.imageTintColorToken.equals(ColorTokenClear()))
        #expect(colors.descriptionTextColorToken.equals(ColorTokenClear()))
        #expect(colors.additionalTextColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let imageTintColorToken = ColorTokenGeneratedMock.random()
        let descriptionTextColorToken = ColorTokenGeneratedMock.random()
        let additionalTextColorToken = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            descriptionTextColorToken: descriptionTextColorToken,
            additionalTextColorToken: additionalTextColorToken
        )

        let colors2 = FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            descriptionTextColorToken: descriptionTextColorToken,
            additionalTextColorToken: additionalTextColorToken
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
        let descriptionTextColorToken = ColorTokenGeneratedMock.random()
        let additionalTextColorToken = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken1,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            descriptionTextColorToken: descriptionTextColorToken,
            additionalTextColorToken: additionalTextColorToken
        )

        let colors2 = FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken2,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            descriptionTextColorToken: descriptionTextColorToken,
            additionalTextColorToken: additionalTextColorToken
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
        let descriptionTextColorToken = ColorTokenGeneratedMock.random()
        let additionalTextColorToken = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken1,
            imageTintColorToken: imageTintColorToken,
            descriptionTextColorToken: descriptionTextColorToken,
            additionalTextColorToken: additionalTextColorToken
        )

        let colors2 = FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken2,
            imageTintColorToken: imageTintColorToken,
            descriptionTextColorToken: descriptionTextColorToken,
            additionalTextColorToken: additionalTextColorToken
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
        let descriptionTextColorToken = ColorTokenGeneratedMock.random()
        let additionalTextColorToken = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken1,
            descriptionTextColorToken: descriptionTextColorToken,
            additionalTextColorToken: additionalTextColorToken
        )

        let colors2 = FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken2,
            descriptionTextColorToken: descriptionTextColorToken,
            additionalTextColorToken: additionalTextColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different description text color token")
    func inequalityWhenDifferentDescriptionTextColorToken() {
        // GIVEN / WHEN
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let imageTintColorToken = ColorTokenGeneratedMock.random()
        let descriptionTextColorToken1 = ColorTokenGeneratedMock.random()
        let descriptionTextColorToken2 = ColorTokenGeneratedMock.random()
        let additionalTextColorToken = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            descriptionTextColorToken: descriptionTextColorToken1,
            additionalTextColorToken: additionalTextColorToken
        )

        let colors2 = FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            descriptionTextColorToken: descriptionTextColorToken2,
            additionalTextColorToken: additionalTextColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different additional text color token")
    func inequalityWhenDifferentAdditionalTextColorToken() {
        // GIVEN / WHEN
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let imageTintColorToken = ColorTokenGeneratedMock.random()
        let descriptionTextColorToken = ColorTokenGeneratedMock.random()
        let additionalTextColorToken1 = ColorTokenGeneratedMock.random()
        let additionalTextColorToken2 = ColorTokenGeneratedMock.random()

        let colors1 = FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            descriptionTextColorToken: descriptionTextColorToken,
            additionalTextColorToken: additionalTextColorToken1
        )

        let colors2 = FileUploadDropzoneColors(
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken,
            imageTintColorToken: imageTintColorToken,
            descriptionTextColorToken: descriptionTextColorToken,
            additionalTextColorToken: additionalTextColorToken2
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
