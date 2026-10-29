//
//  FileUploadToken+DropzoneLayoutTests.swift
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

struct FileUploadTokenDropzoneLayoutTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: FileUploadToken.Dropzone.Layout {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func verticalSpacingShouldReturnLargeSpacing() {
        // GIVEN / WHEN
        let result = self.token.verticalSpacing

        // THEN
        #expect(result == self.theme.layout.spacing.large)
    }

    @Test
    func subVerticalSpacingShouldReturnMediumSpacing() {
        // GIVEN / WHEN
        let result = self.token.subVerticalSpacing

        // THEN
        #expect(result == self.theme.layout.spacing.medium)
    }

    @Test
    func paddingShouldReturnLargeSpacing() {
        // GIVEN / WHEN
        let result = self.token.padding

        // THEN
        #expect(result == self.theme.layout.spacing.large)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken.Dropzone.Layout(theme: self.theme)
        let rhs = FileUploadToken.Dropzone.Layout(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken.Dropzone.Layout(theme: self.theme)
        let rhs = FileUploadToken.Dropzone.Layout(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
