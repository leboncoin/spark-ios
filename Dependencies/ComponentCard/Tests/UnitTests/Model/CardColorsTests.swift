//
//  CardColorsTests.swift
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

@Suite("Card Colors Tests")
struct CardColorsTests {

    @Test("Default initialization with clear tokens")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = CardColors()

        // THEN
        #expect(colors.background is ColorTokenClear)
        #expect(colors.foreground is ColorTokenClear)
        #expect(colors.dimBackground is ColorTokenClear)
        #expect(colors.border is ColorTokenClear)
    }

    @Test("Custom initialization with specific tokens")
    func customInitialization() {
        // GIVEN
        let backgroundToken = ColorTokenGeneratedMock.red()
        let foregroundToken = ColorTokenGeneratedMock.green()
        let dimBackgroundToken = ColorTokenGeneratedMock.yellow()
        let borderToken = ColorTokenGeneratedMock.blue()

        // WHEN
        let colors = CardColors(
            background: backgroundToken,
            foreground: foregroundToken,
            dimBackground: dimBackgroundToken,
            border: borderToken
        )

        // THEN
        #expect(colors.background.equals(backgroundToken) == true)
        #expect(colors.foreground.equals(foregroundToken) == true)
        #expect(colors.dimBackground.equals(dimBackgroundToken) == true)
        #expect(colors.border.equals(borderToken) == true)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN
        let backgroundToken1 = ColorTokenGeneratedMock.red()
        let foregroundToken1 = ColorTokenGeneratedMock.green()
        let dimBackgroundToken1 = ColorTokenGeneratedMock.purple()
        let borderToken1 = ColorTokenGeneratedMock.blue()

        let backgroundToken2 = ColorTokenGeneratedMock.red()
        let foregroundToken2 = ColorTokenGeneratedMock.green()
        let dimBackgroundToken2 = ColorTokenGeneratedMock.purple()
        let borderToken2 = ColorTokenGeneratedMock.blue()

        let colors1 = CardColors(
            background: backgroundToken1,
            foreground: foregroundToken1,
            dimBackground: dimBackgroundToken1,
            border: borderToken1
        )
        let colors2 = CardColors(
            background: backgroundToken2,
            foreground: foregroundToken2,
            dimBackground: dimBackgroundToken2,
            border: borderToken2
        )

        // WHEN / THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different background")
    func inequalityWhenDifferentBackground() {
        // GIVEN
        let backgroundToken1 = ColorTokenGeneratedMock.red()
        let foregroundToken1 = ColorTokenGeneratedMock.green()
        let dimBackgroundToken1 = ColorTokenGeneratedMock.purple()
        let borderToken1 = ColorTokenGeneratedMock.blue()

        let differentBackgroundToken = ColorTokenGeneratedMock.yellow()

        let colors1 = CardColors(
            background: backgroundToken1,
            foreground: foregroundToken1,
            dimBackground: dimBackgroundToken1,
            border: borderToken1
        )
        let colors3 = CardColors(
            background: differentBackgroundToken,
            foreground: foregroundToken1,
            dimBackground: dimBackgroundToken1,
            border: borderToken1
        )

        // WHEN / THEN
        #expect(colors1 != colors3)
    }

    @Test("Inequality when different foreground")
    func inequalityWhenDifferentForeground() {
        // GIVEN
        let backgroundToken1 = ColorTokenGeneratedMock.red()
        let foregroundToken1 = ColorTokenGeneratedMock.green()
        let dimBackgroundToken1 = ColorTokenGeneratedMock.purple()
        let borderToken1 = ColorTokenGeneratedMock.blue()

        let differentForegroundToken = ColorTokenGeneratedMock.orange()

        let colors1 = CardColors(
            background: backgroundToken1,
            foreground: foregroundToken1,
            dimBackground: dimBackgroundToken1,
            border: borderToken1
        )
        let colors4 = CardColors(
            background: backgroundToken1,
            foreground: differentForegroundToken,
            dimBackground: dimBackgroundToken1,
            border: borderToken1
        )

        // WHEN / THEN
        #expect(colors1 != colors4)
    }

    @Test("Inequality when different dim background")
    func inequalityWhenDifferentDimBackground() {
        // GIVEN
        let backgroundToken1 = ColorTokenGeneratedMock.red()
        let foregroundToken1 = ColorTokenGeneratedMock.green()
        let dimBackgroundToken1 = ColorTokenGeneratedMock.purple()
        let borderToken1 = ColorTokenGeneratedMock.blue()

        let differentDimBackgroundToken = ColorTokenGeneratedMock.blue()

        let colors1 = CardColors(
            background: backgroundToken1,
            foreground: foregroundToken1,
            dimBackground: dimBackgroundToken1,
            border: borderToken1
        )
        let colors5 = CardColors(
            background: backgroundToken1,
            foreground: foregroundToken1,
            dimBackground: differentDimBackgroundToken,
            border: borderToken1
        )

        // WHEN / THEN
        #expect(colors1 != colors5)
    }

    @Test("Inequality when different border")
    func inequalityWhenDifferentBorder() {
        // GIVEN
        let backgroundToken1 = ColorTokenGeneratedMock.red()
        let foregroundToken1 = ColorTokenGeneratedMock.green()
        let dimBackgroundToken1 = ColorTokenGeneratedMock.purple()
        let borderToken1 = ColorTokenGeneratedMock.blue()

        let differentBorderToken = ColorTokenGeneratedMock.random()

        let colors1 = CardColors(
            background: backgroundToken1,
            foreground: foregroundToken1,
            dimBackground: dimBackgroundToken1,
            border: borderToken1
        )
        let colors6 = CardColors(
            background: backgroundToken1,
            foreground: foregroundToken1,
            dimBackground: dimBackgroundToken1,
            border: differentBorderToken
        )

        // WHEN / THEN
        #expect(colors1 != colors6)
    }

    @Test("Property mutation")
    func propertyMutation() {
        // GIVEN
        var colors = CardColors()
        let newBackgroundToken = ColorTokenGeneratedMock.yellow()
        let newForegroundToken = ColorTokenGeneratedMock.blue()
        let newDimBackgroundToken = ColorTokenGeneratedMock.red()
        let newBorderToken = ColorTokenGeneratedMock.purple()

        // WHEN
        colors.background = newBackgroundToken
        colors.foreground = newForegroundToken
        colors.dimBackground = newDimBackgroundToken
        colors.border = newBorderToken

        // THEN
        #expect(colors.background.equals(newBackgroundToken) == true)
        #expect(colors.foreground.equals(newForegroundToken) == true)
        #expect(colors.dimBackground.equals(newDimBackgroundToken) == true)
        #expect(colors.border.equals(newBorderToken) == true)
    }
}
