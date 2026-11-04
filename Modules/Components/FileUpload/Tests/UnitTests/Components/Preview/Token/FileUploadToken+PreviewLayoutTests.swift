//
//  FileUploadToken+PreviewLayoutTests.swift
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

struct FileUploadTokenPreviewLayoutTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: FileUploadToken.Preview.Layout {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func spacingShouldReturnMediumSpacing() {
        // GIVEN / WHEN
        let result = self.token.spacing

        // THEN
        #expect(result == self.theme.layout.spacing.medium)
    }

    @Test
    func horizontalPaddingShouldReturnMediumSpacing() {
        // GIVEN / WHEN
        let result = self.token.horizontalPadding

        // THEN
        #expect(result == self.theme.layout.spacing.medium)
    }

    @Test
    func verticalPaddingShouldReturnMediumSpacing() {
        // GIVEN / WHEN
        let result = self.token.verticalPadding

        // THEN
        #expect(result == self.theme.layout.spacing.medium)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken.Preview.Layout(theme: self.theme)
        let rhs = FileUploadToken.Preview.Layout(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken.Preview.Layout(theme: self.theme)
        let rhs = FileUploadToken.Preview.Layout(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
