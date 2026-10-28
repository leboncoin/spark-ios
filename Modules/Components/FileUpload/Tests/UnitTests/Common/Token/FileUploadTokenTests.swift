//
//  FileUploadTokenTests.swift
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

struct FileUploadTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: FileUploadToken {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func dropzoneShouldReturnDropzoneFromTheme() {
        #expect(self.token.dropzone == FileUploadToken.Dropzone(theme: self.theme))
    }

    @Test
    func previewShouldReturnPreviewFromTheme() {
        #expect(self.token.preview == FileUploadToken.Preview(theme: self.theme))
    }

    @Test
    func previewGroupShouldReturnPreviewGroupFromTheme() {
        #expect(self.token.previewGroup == FileUploadToken.PreviewGroup(theme: self.theme))
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken(theme: self.theme)
        let rhs = FileUploadToken(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken(theme: self.theme)
        let rhs = FileUploadToken(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
