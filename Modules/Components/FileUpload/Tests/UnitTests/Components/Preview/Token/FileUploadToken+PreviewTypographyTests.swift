//
//  FileUploadToken+PreviewTypographyTests.swift
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

struct FileUploadTokenPreviewTypographyTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: FileUploadToken.Preview.Typography {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func nameShouldReturnCaption() {
        // GIVEN / WHEN
        let result = self.token.name

        // THEN
        #expect(result.equals(self.theme.typography.caption))
    }

    @Test
    func sizeShouldReturnCaption() {
        // GIVEN / WHEN
        let result = self.token.size

        // THEN
        #expect(result.equals(self.theme.typography.caption))
    }

    @Test
    func errorShouldReturnCaption() {
        // GIVEN / WHEN
        let result = self.token.error

        // THEN
        #expect(result.equals(self.theme.typography.caption))
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken.Preview.Typography(theme: self.theme)
        let rhs = FileUploadToken.Preview.Typography(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken.Preview.Typography(theme: self.theme)
        let rhs = FileUploadToken.Preview.Typography(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
