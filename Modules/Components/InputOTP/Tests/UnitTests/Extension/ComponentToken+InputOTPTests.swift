//
//  ComponentToken+InputOTPTests.swift
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

struct ComponentTokenInputOTPTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Input OTP should return token from theme")
    func inputOTPShouldReturnTokenFromTheme() {
        #expect(ComponentToken(theme: self.theme).inputOTP == InputOTPToken(theme: self.theme))
    }

    @Test("Input OTP from theme component should return token from theme")
    func inputOTPFromThemeComponentShouldReturnTokenFromTheme() {
        #expect(self.theme.component.inputOTP == InputOTPToken(theme: self.theme))
    }

    @Test("Input OTP with different theme should not return token from theme")
    func inputOTPWithDifferentThemeShouldNotReturnTokenFromTheme() {
        #expect(ComponentToken(theme: ThemeGeneratedMock.mocked2()).inputOTP != InputOTPToken(theme: self.theme))
    }
}
