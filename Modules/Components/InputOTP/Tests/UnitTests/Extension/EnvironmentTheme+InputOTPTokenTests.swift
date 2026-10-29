//
//  EnvironmentTheme+InputOTPTokenTests.swift
//  SparkComponentInputOTPTests
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentInputOTP
@testable import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct EnvironmentThemeInputOTPTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var environmentTheme: EnvironmentTheme {
        return .init(value: self.theme)
    }

    private var token: InputOTPToken {
        return self.theme.component.inputOTP
    }

    // MARK: - Tests

    @Test("Border should return input OTP border")
    func borderShouldReturnInputOTPBorder() {
        #expect(self.environmentTheme.border == self.token.border)
    }

    @Test("Colors should return input OTP colors")
    func colorsShouldReturnInputOTPColors() {
        #expect(self.environmentTheme.colors == self.token.colors)
    }

    @Test("Layout should return input OTP layout")
    func layoutShouldReturnInputOTPLayout() {
        #expect(self.environmentTheme.layout == self.token.layout)
    }

    @Test("Opacity should return input OTP opacity")
    func opacityShouldReturnInputOTPOpacity() {
        #expect(self.environmentTheme.opacity == self.token.opacity)
    }

    @Test("Typography should return input OTP typography")
    func typographyShouldReturnInputOTPTypography() {
        #expect(self.environmentTheme.typography == self.token.typography)
    }

    @Test("Size should return input OTP size")
    func sizeShouldReturnInputOTPSize() {
        #expect(self.environmentTheme.size == self.token.size)
    }
}
