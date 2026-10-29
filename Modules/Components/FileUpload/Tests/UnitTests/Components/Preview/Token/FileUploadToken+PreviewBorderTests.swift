//
//  FileUploadToken+PreviewBorderTests.swift
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

struct FileUploadTokenPreviewBorderTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: FileUploadToken.Preview.Border {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Radius should return medium radius")
    func radiusShouldReturnMediumRadius() {
        // GIVEN / WHEN
        let result = self.token.radius

        // THEN
        #expect(result == self.theme.border.radius.medium)
    }

    @Test("Image radius should return medium width")
    func imageRadiusShouldReturnMediumWidth() {
        // GIVEN / WHEN
        let result = self.token.imageRadius

        // THEN
        #expect(result == self.theme.border.width.medium)
    }

    @Test("Width when succeed should return small width")
    func widthWhenSucceedShouldReturnSmallWidth() {
        // GIVEN / WHEN
        let result = self.token.width(isSucceed: true)

        // THEN
        #expect(result == self.theme.border.width.small)
    }

    @Test("Width when failed should return medium width")
    func widthWhenFailedShouldReturnMediumWidth() {
        // GIVEN / WHEN
        let result = self.token.width(isSucceed: false)

        // THEN
        #expect(result == self.theme.border.width.medium)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken.Preview.Border(theme: self.theme)
        let rhs = FileUploadToken.Preview.Border(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken.Preview.Border(theme: self.theme)
        let rhs = FileUploadToken.Preview.Border(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
