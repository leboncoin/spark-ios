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

    @Test
    func radiusShouldReturnMediumRadius() {
        // GIVEN / WHEN
        let result = self.token.radius

        // THEN
        #expect(result == self.theme.border.radius.medium)
    }

    @Test
    func imageRadiusShouldReturnMediumWidth() {
        // GIVEN / WHEN
        let result = self.token.imageRadius

        // THEN
        #expect(result == self.theme.border.width.medium)
    }

    @Test
    func widthWhenSucceedShouldReturnSmallWidth() {
        // GIVEN / WHEN
        let result = self.token.width(isSucceed: true)

        // THEN
        #expect(result == self.theme.border.width.small)
    }

    @Test
    func widthWhenFailedShouldReturnMediumWidth() {
        // GIVEN / WHEN
        let result = self.token.width(isSucceed: false)

        // THEN
        #expect(result == self.theme.border.width.medium)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken.Preview.Border(theme: self.theme)
        let rhs = FileUploadToken.Preview.Border(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken.Preview.Border(theme: self.theme)
        let rhs = FileUploadToken.Preview.Border(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
