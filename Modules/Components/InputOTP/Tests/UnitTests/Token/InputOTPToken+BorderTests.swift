//
//  InputOTPToken+BorderTests.swift
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

struct InputOTPTokenBorderTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: InputOTPToken.Border {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Slot radius should return radius medium")
    func slotRadiusShouldReturnRadiusMedium() {
        #expect(self.token.slotRadius == self.theme.border.radius.medium)
    }

    @Test("Slot width should return expected value", arguments: [(false, false), (true, false), (false, true), (true, true)])
    func slotWidthShouldReturnExpectedValue(onError: Bool, isFocus: Bool) {
        // GIVEN
        let expected = onError || isFocus ? self.theme.border.width.medium : self.theme.border.width.small

        // WHEN
        let result = self.token.slotWidth(onError: onError, isFocus: isFocus)

        // THEN
        #expect(result == expected)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(InputOTPToken.Border(theme: self.theme) == InputOTPToken.Border(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(InputOTPToken.Border(theme: self.theme) != InputOTPToken.Border(theme: ThemeGeneratedMock.mocked2()))
    }
}
