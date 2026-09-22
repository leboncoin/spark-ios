//
//  CardHeaderColorsTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

// MARK: - Tests

@Suite("Card Header Colors Tests")
struct CardHeaderColorsTests {

    @Test("Initialization with specific tokens")
    func initialization() {
        // GIVEN
        let backgroundToken = ColorTokenGeneratedMock.red()
        let foregroundToken = ColorTokenGeneratedMock.blue()

        // WHEN
        let colors = CardHeaderColors(
            background: backgroundToken,
            foreground: foregroundToken
        )

        // THEN
        #expect(colors.background.equals(backgroundToken) == true)
        #expect(colors.foreground.equals(foregroundToken) == true)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN
        let backgroundToken1 = ColorTokenGeneratedMock.red()
        let foregroundToken1 = ColorTokenGeneratedMock.blue()

        let backgroundToken2 = ColorTokenGeneratedMock.red()
        let foregroundToken2 = ColorTokenGeneratedMock.blue()

        let colors1 = CardHeaderColors(
            background: backgroundToken1,
            foreground: foregroundToken1
        )
        let colors2 = CardHeaderColors(
            background: backgroundToken2,
            foreground: foregroundToken2
        )

        // WHEN / THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different background")
    func inequalityWhenDifferentBackground() {
        // GIVEN
        let backgroundToken1 = ColorTokenGeneratedMock.red()
        let foregroundToken1 = ColorTokenGeneratedMock.blue()

        let differentBackgroundToken = ColorTokenGeneratedMock.green()

        let colors1 = CardHeaderColors(
            background: backgroundToken1,
            foreground: foregroundToken1
        )
        let colors3 = CardHeaderColors(
            background: differentBackgroundToken,
            foreground: foregroundToken1
        )

        // WHEN / THEN
        #expect(colors1 != colors3)
    }

    @Test("Inequality when different foreground")
    func inequalityWhenDifferentForeground() {
        // GIVEN
        let backgroundToken1 = ColorTokenGeneratedMock.red()
        let foregroundToken1 = ColorTokenGeneratedMock.blue()

        let differentForegroundToken = ColorTokenGeneratedMock.yellow()

        let colors1 = CardHeaderColors(
            background: backgroundToken1,
            foreground: foregroundToken1
        )
        let colors4 = CardHeaderColors(
            background: backgroundToken1,
            foreground: differentForegroundToken
        )

        // WHEN / THEN
        #expect(colors1 != colors4)
    }

    @Test("Property mutation")
    func propertyMutation() {
        // GIVEN
        let initialBackgroundToken = ColorTokenGeneratedMock.red()
        let initialForegroundToken = ColorTokenGeneratedMock.blue()

        var colors = CardHeaderColors(
            background: initialBackgroundToken,
            foreground: initialForegroundToken
        )

        let newBackgroundToken = ColorTokenGeneratedMock.green()
        let newForegroundToken = ColorTokenGeneratedMock.purple()

        // WHEN
        colors.background = newBackgroundToken
        colors.foreground = newForegroundToken

        // THEN
        #expect(colors.background.equals(newBackgroundToken) == true)
        #expect(colors.foreground.equals(newForegroundToken) == true)
    }
}
