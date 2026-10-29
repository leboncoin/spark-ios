//
//  FileUploadToken+DropzoneBorderTests.swift
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

struct FileUploadTokenDropzoneBorderTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: FileUploadToken.Dropzone.Border {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Width should return small width")
    func widthShouldReturnSmallWidth() {
        // GIVEN / WHEN
        let result = self.token.width

        // THEN
        #expect(result == self.theme.border.width.small)
    }

    @Test("Radius should return large radius")
    func radiusShouldReturnLargeRadius() {
        // GIVEN / WHEN
        let result = self.token.radius

        // THEN
        #expect(result == self.theme.border.radius.large)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken.Dropzone.Border(theme: self.theme)
        let rhs = FileUploadToken.Dropzone.Border(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken.Dropzone.Border(theme: self.theme)
        let rhs = FileUploadToken.Dropzone.Border(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
