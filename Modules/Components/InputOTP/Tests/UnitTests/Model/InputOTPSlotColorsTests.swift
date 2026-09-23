//
//  InputOTPSlotColorsTests.swift
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

@Suite("Input OTP Slot Colors Tests")
struct InputOTPSlotColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = InputOTPSlotColors()

        // THEN
        #expect(colors.contentColorToken.equals(ColorTokenClear()))
        #expect(colors.borderColorToken.equals(ColorTokenClear()))
        #expect(colors.backgroundColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let contentColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let backgroundColorToken = ColorTokenGeneratedMock.random()

        let colors1 = InputOTPSlotColors(
            contentColorToken: contentColorToken,
            borderColorToken: borderColorToken,
            backgroundColorToken: backgroundColorToken
        )

        let colors2 = InputOTPSlotColors(
            contentColorToken: contentColorToken,
            borderColorToken: borderColorToken,
            backgroundColorToken: backgroundColorToken
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different content color")
    func inequalityWhenDifferentContentColor() {
        // GIVEN / WHEN
        let contentColorToken1 = ColorTokenGeneratedMock.random()
        let contentColorToken2 = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let backgroundColorToken = ColorTokenGeneratedMock.random()

        let colors1 = InputOTPSlotColors(
            contentColorToken: contentColorToken1,
            borderColorToken: borderColorToken,
            backgroundColorToken: backgroundColorToken
        )

        let colors2 = InputOTPSlotColors(
            contentColorToken: contentColorToken2,
            borderColorToken: borderColorToken,
            backgroundColorToken: backgroundColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different border color")
    func inequalityWhenDifferentBorderColor() {
        // GIVEN / WHEN
        let contentColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken1 = ColorTokenGeneratedMock.random()
        let borderColorToken2 = ColorTokenGeneratedMock.random()
        let backgroundColorToken = ColorTokenGeneratedMock.random()

        let colors1 = InputOTPSlotColors(
            contentColorToken: contentColorToken,
            borderColorToken: borderColorToken1,
            backgroundColorToken: backgroundColorToken
        )

        let colors2 = InputOTPSlotColors(
            contentColorToken: contentColorToken,
            borderColorToken: borderColorToken2,
            backgroundColorToken: backgroundColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different background color")
    func inequalityWhenDifferentBackgroundColor() {
        // GIVEN / WHEN
        let contentColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()
        let backgroundColorToken1 = ColorTokenGeneratedMock.random()
        let backgroundColorToken2 = ColorTokenGeneratedMock.random()

        let colors1 = InputOTPSlotColors(
            contentColorToken: contentColorToken,
            borderColorToken: borderColorToken,
            backgroundColorToken: backgroundColorToken1
        )

        let colors2 = InputOTPSlotColors(
            contentColorToken: contentColorToken,
            borderColorToken: borderColorToken,
            backgroundColorToken: backgroundColorToken2
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
