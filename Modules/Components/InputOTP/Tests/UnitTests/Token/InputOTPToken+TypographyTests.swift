//
//  InputOTPToken+TypographyTests.swift
//  SparkComponentInputOTPTests
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct InputOTPTokenTypographyTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: InputOTPToken.Typography {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Content should return display 3")
    func contentShouldReturnDisplay3() {
        #expect(self.token.content.font == self.theme.typography.display3.font)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(InputOTPToken.Typography(theme: self.theme) == InputOTPToken.Typography(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        let other = InputOTPToken.Typography(theme: ThemeGeneratedMock.mocked2())
        #expect(InputOTPToken.Typography(theme: self.theme) != other)
    }
}
