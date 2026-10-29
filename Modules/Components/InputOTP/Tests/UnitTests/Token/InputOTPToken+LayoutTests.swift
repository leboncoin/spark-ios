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

    @Test
    func spacingShouldReturnSpacingMedium() {
        #expect(self.token.spacing == self.theme.layout.spacing.medium)
    }

    @Test
    func paddingShouldReturnSpacingMedium() {
        #expect(self.token.padding == self.theme.layout.spacing.medium)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(InputOTPToken.Layout(theme: self.theme) == InputOTPToken.Layout(theme: self.theme))
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(InputOTPToken.Layout(theme: self.theme) != InputOTPToken.Layout(theme: ThemeGeneratedMock.mocked2()))
    }
}
