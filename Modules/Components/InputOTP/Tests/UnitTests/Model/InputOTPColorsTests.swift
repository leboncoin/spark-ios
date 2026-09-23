//
//  InputOTPColorsTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Input OTP Colors Tests")
struct InputOTPColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = InputOTPColors()

        // THEN
        #expect(colors.separatorColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let separatorColorToken = ColorTokenGeneratedMock.random()

        let colors1 = InputOTPColors(
            separatorColorToken: separatorColorToken
        )

        let colors2 = InputOTPColors(
            separatorColorToken: separatorColorToken
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different separator color")
    func inequalityWhenDifferentSeparatorColor() {
        // GIVEN / WHEN
        let separatorColorToken1 = ColorTokenGeneratedMock.random()
        let separatorColorToken2 = ColorTokenGeneratedMock.random()

        let colors1 = InputOTPColors(
            separatorColorToken: separatorColorToken1
        )

        let colors2 = InputOTPColors(
            separatorColorToken: separatorColorToken2
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
