//
//  XXXToken+TypographyTests.swift
//  SparkComponentXXXTests
//
//  Created by {Firstname Lastname} on DD/MM/YYYY.
//  Copyright © YYYY Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentXXX
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct XXXTokenTypographyTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: XXXToken.Typography {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Title should return body1")
    func titleShouldReturnBody1() {
        #expect(self.token.title.font == self.theme.typography.body1.font)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(XXXToken.Typography(theme: self.theme) == XXXToken.Typography(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(XXXToken.Typography(theme: self.theme) != XXXToken.Typography(theme: ThemeGeneratedMock.mocked2()))
    }
}
