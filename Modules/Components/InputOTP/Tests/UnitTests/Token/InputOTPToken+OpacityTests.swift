//
//  InputOTPToken+OpacityTests.swift
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

struct InputOTPTokenOpacityTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: InputOTPToken.Opacity {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Opacity when enabled should return dim none")
    func opacityWhenEnabledShouldReturnDimNone() {
        #expect(self.token.value(isEnabled: true) == self.theme.dims.none)
    }

    @Test("Opacity when disabled should return dim 3")
    func opacityWhenDisabledShouldReturnDim3() {
        #expect(self.token.value(isEnabled: false) == self.theme.dims.dim3)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(InputOTPToken.Opacity(theme: self.theme) == InputOTPToken.Opacity(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(InputOTPToken.Opacity(theme: self.theme) != InputOTPToken.Opacity(theme: ThemeGeneratedMock.mocked2()))
    }
}
