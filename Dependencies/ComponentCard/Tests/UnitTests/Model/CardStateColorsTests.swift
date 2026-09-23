//
//  CardStateColorsTests.swift
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

@Suite("Card State Colors Tests")
struct CardStateColorsTests {

    @Test("Default initialization with clear tokens")
    func defaultInitialization() {
        // GIVEN / WHEN
        let stateColors = CardStateColors()

        // THEN
        #expect(stateColors.border is ColorTokenClear)
        #expect(stateColors.pressedBorder is ColorTokenClear)
        #expect(stateColors.background is ColorTokenClear)
        #expect(stateColors.pressedBackground is ColorTokenClear)
        #expect(stateColors.foreground is ColorTokenClear)
    }

    @Test("Full initialization with all parameters")
    func fullInitialization() {
        // GIVEN
        let borderToken = ColorTokenGeneratedMock.red()
        let pressedBorderToken = ColorTokenGeneratedMock.red()
        let backgroundToken = ColorTokenGeneratedMock.blue()
        let pressedBackgroundToken = ColorTokenGeneratedMock.blue()
        let foregroundToken = ColorTokenGeneratedMock.green()

        // WHEN
        let stateColors = CardStateColors(
            border: borderToken,
            pressedBorder: pressedBorderToken,
            background: backgroundToken,
            pressedBackground: pressedBackgroundToken,
            foreground: foregroundToken
        )

        // THEN
        #expect(stateColors.border.equals(borderToken) == true)
        #expect(stateColors.pressedBorder.equals(pressedBorderToken) == true)
        #expect(stateColors.background.equals(backgroundToken) == true)
        #expect(stateColors.pressedBackground.equals(pressedBackgroundToken) == true)
        #expect(stateColors.foreground.equals(foregroundToken) == true)
    }

    @Test("Convenience initialization")
    func convenienceInitialization() {
        // GIVEN
        let backgroundToken = ColorTokenGeneratedMock.green()
        let pressedToken = ColorTokenGeneratedMock.yellow()
        let foregroundToken = ColorTokenGeneratedMock.purple()

        // WHEN
        let stateColors = CardStateColors(
            background: backgroundToken,
            pressed: pressedToken,
            foreground: foregroundToken
        )

        // THEN
        #expect(stateColors.border.equals(backgroundToken) == true)
        #expect(stateColors.pressedBorder.equals(pressedToken) == true)
        #expect(stateColors.background.equals(backgroundToken) == true)
        #expect(stateColors.pressedBackground.equals(pressedToken) == true)
        #expect(stateColors.foreground.equals(foregroundToken) == true)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN
        let borderToken1 = ColorTokenGeneratedMock.red()
        let pressedBorderToken1 = ColorTokenGeneratedMock.red()
        let backgroundToken1 = ColorTokenGeneratedMock.blue()
        let pressedBackgroundToken1 = ColorTokenGeneratedMock.blue()
        let foregroundToken1 = ColorTokenGeneratedMock.green()

        let borderToken2 = ColorTokenGeneratedMock.red()
        let pressedBorderToken2 = ColorTokenGeneratedMock.red()
        let backgroundToken2 = ColorTokenGeneratedMock.blue()
        let pressedBackgroundToken2 = ColorTokenGeneratedMock.blue()
        let foregroundToken2 = ColorTokenGeneratedMock.green()

        let stateColors1 = CardStateColors(
            border: borderToken1,
            pressedBorder: pressedBorderToken1,
            background: backgroundToken1,
            pressedBackground: pressedBackgroundToken1,
            foreground: foregroundToken1
        )

        let stateColors2 = CardStateColors(
            border: borderToken2,
            pressedBorder: pressedBorderToken2,
            background: backgroundToken2,
            pressedBackground: pressedBackgroundToken2,
            foreground: foregroundToken2
        )

        // WHEN / THEN
        #expect(stateColors1 == stateColors2)
    }

    @Test("Inequality when different border")
    func inequalityWhenDifferentBorder() {
        // GIVEN
        let borderToken1 = ColorTokenGeneratedMock.red()
        let pressedBorderToken1 = ColorTokenGeneratedMock.red()
        let backgroundToken1 = ColorTokenGeneratedMock.blue()
        let pressedBackgroundToken1 = ColorTokenGeneratedMock.blue()
        let foregroundToken1 = ColorTokenGeneratedMock.green()

        let differentBorderToken = ColorTokenGeneratedMock.green()

        let stateColors1 = CardStateColors(
            border: borderToken1,
            pressedBorder: pressedBorderToken1,
            background: backgroundToken1,
            pressedBackground: pressedBackgroundToken1,
            foreground: foregroundToken1
        )

        let stateColors3 = CardStateColors(
            border: differentBorderToken,
            pressedBorder: pressedBorderToken1,
            background: backgroundToken1,
            pressedBackground: pressedBackgroundToken1,
            foreground: foregroundToken1
        )

        // WHEN / THEN
        #expect(stateColors1 != stateColors3)
    }

    @Test("Inequality when different pressed border")
    func inequalityWhenDifferentPressedBorder() {
        // GIVEN
        let borderToken = ColorTokenGeneratedMock.red()
        let pressedBorderToken = ColorTokenGeneratedMock.red()
        let backgroundToken = ColorTokenGeneratedMock.blue()
        let pressedBackgroundToken = ColorTokenGeneratedMock.blue()
        let foregroundToken = ColorTokenGeneratedMock.green()
        let differentToken = ColorTokenGeneratedMock.yellow()

        let baseStateColors = CardStateColors(
            border: borderToken,
            pressedBorder: pressedBorderToken,
            background: backgroundToken,
            pressedBackground: pressedBackgroundToken,
            foreground: foregroundToken
        )

        let differentPressedBorder = CardStateColors(
            border: borderToken,
            pressedBorder: differentToken,
            background: backgroundToken,
            pressedBackground: pressedBackgroundToken,
            foreground: foregroundToken
        )

        // WHEN / THEN
        #expect(baseStateColors != differentPressedBorder)
    }

    @Test("Inequality when different background")
    func inequalityWhenDifferentBackground() {
        // GIVEN
        let borderToken = ColorTokenGeneratedMock.red()
        let pressedBorderToken = ColorTokenGeneratedMock.red()
        let backgroundToken = ColorTokenGeneratedMock.blue()
        let pressedBackgroundToken = ColorTokenGeneratedMock.blue()
        let foregroundToken = ColorTokenGeneratedMock.green()
        let differentToken = ColorTokenGeneratedMock.yellow()

        let baseStateColors = CardStateColors(
            border: borderToken,
            pressedBorder: pressedBorderToken,
            background: backgroundToken,
            pressedBackground: pressedBackgroundToken,
            foreground: foregroundToken
        )

        let differentBackground = CardStateColors(
            border: borderToken,
            pressedBorder: pressedBorderToken,
            background: differentToken,
            pressedBackground: pressedBackgroundToken,
            foreground: foregroundToken
        )

        // WHEN / THEN
        #expect(baseStateColors != differentBackground)
    }

    @Test("Inequality when different pressed background")
    func inequalityWhenDifferentPressedBackground() {
        // GIVEN
        let borderToken = ColorTokenGeneratedMock.red()
        let pressedBorderToken = ColorTokenGeneratedMock.red()
        let backgroundToken = ColorTokenGeneratedMock.blue()
        let pressedBackgroundToken = ColorTokenGeneratedMock.blue()
        let foregroundToken = ColorTokenGeneratedMock.green()
        let differentToken = ColorTokenGeneratedMock.yellow()

        let baseStateColors = CardStateColors(
            border: borderToken,
            pressedBorder: pressedBorderToken,
            background: backgroundToken,
            pressedBackground: pressedBackgroundToken,
            foreground: foregroundToken
        )

        let differentPressedBackground = CardStateColors(
            border: borderToken,
            pressedBorder: pressedBorderToken,
            background: backgroundToken,
            pressedBackground: differentToken,
            foreground: foregroundToken
        )

        // WHEN / THEN
        #expect(baseStateColors != differentPressedBackground)
    }

    @Test("Inequality when different foreground")
    func inequalityWhenDifferentForeground() {
        // GIVEN
        let borderToken = ColorTokenGeneratedMock.red()
        let pressedBorderToken = ColorTokenGeneratedMock.red()
        let backgroundToken = ColorTokenGeneratedMock.blue()
        let pressedBackgroundToken = ColorTokenGeneratedMock.blue()
        let foregroundToken = ColorTokenGeneratedMock.green()
        let differentToken = ColorTokenGeneratedMock.yellow()

        let baseStateColors = CardStateColors(
            border: borderToken,
            pressedBorder: pressedBorderToken,
            background: backgroundToken,
            pressedBackground: pressedBackgroundToken,
            foreground: foregroundToken
        )

        let differentForeground = CardStateColors(
            border: borderToken,
            pressedBorder: pressedBorderToken,
            background: backgroundToken,
            pressedBackground: pressedBackgroundToken,
            foreground: differentToken
        )

        // WHEN / THEN
        #expect(baseStateColors != differentForeground)
    }

    @Test("Property mutation")
    func propertyMutation() {
        // GIVEN
        var stateColors = CardStateColors()
        let newBorderToken = ColorTokenGeneratedMock.purple()
        let newPressedBorderToken = ColorTokenGeneratedMock.random()
        let newBackgroundToken = ColorTokenGeneratedMock.orange()
        let newPressedBackgroundToken = ColorTokenGeneratedMock.random()
        let newForegroundToken = ColorTokenGeneratedMock.blue()

        // WHEN
        stateColors.border = newBorderToken
        stateColors.pressedBorder = newPressedBorderToken
        stateColors.background = newBackgroundToken
        stateColors.pressedBackground = newPressedBackgroundToken
        stateColors.foreground = newForegroundToken

        // THEN
        #expect(stateColors.border.equals(newBorderToken) == true)
        #expect(stateColors.pressedBorder.equals(newPressedBorderToken) == true)
        #expect(stateColors.background.equals(newBackgroundToken) == true)
        #expect(stateColors.pressedBackground.equals(newPressedBackgroundToken) == true)
        #expect(stateColors.foreground.equals(newForegroundToken) == true)
    }
}
