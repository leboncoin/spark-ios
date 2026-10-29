//
//  FileUploadToken+DropzoneTypographyTests.swift
//  SparkComponentFileUploadTests
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct FileUploadTokenDropzoneTypographyTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: FileUploadToken.Dropzone.Typography {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Description text should return body 1 highlight")
    func descriptionTextShouldReturnBody1Highlight() {
        // GIVEN / WHEN
        let result = self.token.descriptionText

        // THEN
        #expect(result.equals(self.theme.typography.body1Highlight))
    }

    @Test("Additional text should return caption")
    func additionalTextShouldReturnCaption() {
        // GIVEN / WHEN
        let result = self.token.additionalText

        // THEN
        #expect(result.equals(self.theme.typography.caption))
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken.Dropzone.Typography(theme: self.theme)
        let rhs = FileUploadToken.Dropzone.Typography(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken.Dropzone.Typography(theme: self.theme)
        let rhs = FileUploadToken.Dropzone.Typography(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
