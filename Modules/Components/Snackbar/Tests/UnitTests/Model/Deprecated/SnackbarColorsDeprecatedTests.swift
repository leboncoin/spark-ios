//
//  SnackbarColorsDeprecatedTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming
@testable import SparkComponentSnackbar
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Snackbar Colors Tests")
struct SnackbarColorsDeprecatedTests {

    // MARK: - Tests

    @Test("Initialize with background and foreground colors")
    func initializeWithBackgroundAndForegroundColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let givenBackgroundColor = theme.colors.feedback.success
        let givenForegroundColor = theme.colors.feedback.onSuccess

        // WHEN
        let colors = SnackbarColorsDeprecated(
            background: givenBackgroundColor,
            foreground: givenForegroundColor
        )

        // THEN
        #expect(colors.background.equals(givenBackgroundColor))
        #expect(colors.foreground.equals(givenForegroundColor))
    }

    @Test("Initialize with different color combinations")
    func initializeWithDifferentColorCombinations() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let testCases: [(any ColorToken, any ColorToken)] = [
            (theme.colors.feedback.alert, theme.colors.feedback.onAlert),
            (theme.colors.feedback.error, theme.colors.feedback.onError),
            (theme.colors.feedback.info, theme.colors.feedback.onInfo),
            (theme.colors.main.main, theme.colors.main.onMain)
        ]

        for (background, foreground) in testCases {
            // WHEN
            let colors = SnackbarColorsDeprecated(
                background: background,
                foreground: foreground
            )

            // THEN
            #expect(colors.background.equals(background))
            #expect(colors.foreground.equals(foreground))
        }
    }

    @Test("Public accessibility of SnackbarColorsDeprecated")
    func publicAccessibilityOfSnackbarColorsDeprecated() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let backgroundColor = theme.colors.feedback.success
        let foregroundColor = theme.colors.feedback.onSuccess

        // WHEN
        let colors = SnackbarColorsDeprecated(
            background: backgroundColor,
            foreground: foregroundColor
        )

        // THEN - Verify that the struct and init are public
        #expect(colors.background.equals(backgroundColor))
        #expect(colors.foreground.equals(foregroundColor))
    }
}
