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

    @Test("Spacing should return medium spacing")
    func spacingShouldReturnMediumSpacing() {
        // GIVEN / WHEN
        let result = self.token.spacing

        // THEN
        #expect(result == self.theme.layout.spacing.medium)
    }

    @Test("Horizontal padding should return medium spacing")
    func horizontalPaddingShouldReturnMediumSpacing() {
        // GIVEN / WHEN
        let result = self.token.horizontalPadding

        // THEN
        #expect(result == self.theme.layout.spacing.medium)
    }

    @Test("Vertical padding should return medium spacing")
    func verticalPaddingShouldReturnMediumSpacing() {
        // GIVEN / WHEN
        let result = self.token.verticalPadding

        // THEN
        #expect(result == self.theme.layout.spacing.medium)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken.Preview.Layout(theme: self.theme)
        let rhs = FileUploadToken.Preview.Layout(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken.Preview.Layout(theme: self.theme)
        let rhs = FileUploadToken.Preview.Layout(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
