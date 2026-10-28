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

    @Test
    func contentShouldReturnDisplay3() {
        #expect(self.token.content.font == self.theme.typography.display3.font)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(InputOTPToken.Typography(theme: self.theme) == InputOTPToken.Typography(theme: self.theme))
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        let other = InputOTPToken.Typography(theme: ThemeGeneratedMock.mocked2())
        #expect(InputOTPToken.Typography(theme: self.theme) != other)
    }
}
