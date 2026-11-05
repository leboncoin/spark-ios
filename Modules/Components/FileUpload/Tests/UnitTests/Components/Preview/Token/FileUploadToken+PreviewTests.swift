//
//  FileUploadToken+PreviewTests.swift
//  SparkComponentFileUploadTests
//
//  Created by Robin Lemaire on 02/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentFileUpload
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct FileUploadTokenPreviewTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Init should set all categories")
    func initShouldSetAllCategories() {
        // GIVEN / WHEN
        let token = FileUploadToken.Preview(theme: self.theme)

        // THEN
        #expect(token.border == .init(theme: self.theme))
        #expect(token.button == .init())
        #expect(token.colors == .init(theme: self.theme))
        #expect(token.layout == .init(theme: self.theme))
        #expect(token.scaleEffect == .init())
        #expect(token.size == .init())
        #expect(token.typography == .init(theme: self.theme))
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = FileUploadToken.Preview(theme: self.theme)
        let rhs = FileUploadToken.Preview(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = FileUploadToken.Preview(theme: self.theme)
        let rhs = FileUploadToken.Preview(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
