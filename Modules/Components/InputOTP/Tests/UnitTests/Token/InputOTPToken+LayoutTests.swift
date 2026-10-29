//
//  InputOTPToken+LayoutTests.swift
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

struct InputOTPTokenLayoutTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: InputOTPToken.Layout {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Spacing should return spacing medium")
    func spacingShouldReturnSpacingMedium() {
        #expect(self.token.spacing == self.theme.layout.spacing.medium)
    }

    @Test("Padding should return spacing medium")
    func paddingShouldReturnSpacingMedium() {
        #expect(self.token.padding == self.theme.layout.spacing.medium)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(InputOTPToken.Layout(theme: self.theme) == InputOTPToken.Layout(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(InputOTPToken.Layout(theme: self.theme) != InputOTPToken.Layout(theme: ThemeGeneratedMock.mocked2()))
    }
}
