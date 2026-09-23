//
//  SnackbarColorsTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentSnackbar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Snackbar Colors Tests")
struct SnackbarColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = SnackbarColors()

        // THEN
        #expect(colors.tintColorToken.equals(ColorTokenClear()))
        #expect(colors.backgroundColorToken.equals(ColorTokenClear()))
        #expect(colors.borderColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let tintColorToken = ColorTokenGeneratedMock.random()
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()

        let colors1 = SnackbarColors(
            tintColorToken: tintColorToken,
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken
        )

        let colors2 = SnackbarColors(
            tintColorToken: tintColorToken,
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different tint color token")
    func inequalityWhenDifferentTintColorToken() {
        // GIVEN / WHEN
        let tintColorToken1 = ColorTokenGeneratedMock.random()
        let tintColorToken2 = ColorTokenGeneratedMock.random()
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()

        let colors1 = SnackbarColors(
            tintColorToken: tintColorToken1,
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken
        )

        let colors2 = SnackbarColors(
            tintColorToken: tintColorToken2,
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different background color token")
    func inequalityWhenDifferentBackgroundColorToken() {
        // GIVEN / WHEN
        let tintColorToken = ColorTokenGeneratedMock.random()
        let backgroundColorToken1 = ColorTokenGeneratedMock.random()
        let backgroundColorToken2 = ColorTokenGeneratedMock.random()
        let borderColorToken = ColorTokenGeneratedMock.random()

        let colors1 = SnackbarColors(
            tintColorToken: tintColorToken,
            backgroundColorToken: backgroundColorToken1,
            borderColorToken: borderColorToken
        )

        let colors2 = SnackbarColors(
            tintColorToken: tintColorToken,
            backgroundColorToken: backgroundColorToken2,
            borderColorToken: borderColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different border color token")
    func inequalityWhenDifferentBorderColorToken() {
        // GIVEN / WHEN
        let tintColorToken = ColorTokenGeneratedMock.random()
        let backgroundColorToken = ColorTokenGeneratedMock.random()
        let borderColorToken1 = ColorTokenGeneratedMock.random()
        let borderColorToken2 = ColorTokenGeneratedMock.random()

        let colors1 = SnackbarColors(
            tintColorToken: tintColorToken,
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken1
        )

        let colors2 = SnackbarColors(
            tintColorToken: tintColorToken,
            backgroundColorToken: backgroundColorToken,
            borderColorToken: borderColorToken2
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
