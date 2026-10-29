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

    @Test
    func opacityWhenEnabledShouldReturnDimNone() {
        #expect(self.token.value(isEnabled: true) == self.theme.dims.none)
    }

    @Test
    func opacityWhenDisabledShouldReturnDim3() {
        #expect(self.token.value(isEnabled: false) == self.theme.dims.dim3)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(InputOTPToken.Opacity(theme: self.theme) == InputOTPToken.Opacity(theme: self.theme))
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(InputOTPToken.Opacity(theme: self.theme) != InputOTPToken.Opacity(theme: ThemeGeneratedMock.mocked2()))
    }
}
