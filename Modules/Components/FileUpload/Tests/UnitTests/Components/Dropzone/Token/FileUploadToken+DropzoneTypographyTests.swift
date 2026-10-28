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

    @Test
    func descriptionTextShouldReturnBody1Highlight() {
        // GIVEN / WHEN
        let result = self.token.descriptionText

        // THEN
        #expect(result.equals(self.theme.typography.body1Highlight))
    }

    @Test
    func additionalTextShouldReturnCaption() {
        // GIVEN / WHEN
        let result = self.token.additionalText

        // THEN
        #expect(result.equals(self.theme.typography.caption))
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken.Dropzone.Typography(theme: self.theme)
        let rhs = FileUploadToken.Dropzone.Typography(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken.Dropzone.Typography(theme: self.theme)
        let rhs = FileUploadToken.Dropzone.Typography(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
