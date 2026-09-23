//
//  TabAccessibilityColorsTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentTab
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Tab Accessibility Colors Tests")
struct TabAccessibilityColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = TabAccessibilityColors()

        // THEN
        #expect(colors.selectedTintColorToken.equals(ColorTokenClear()))
        #expect(colors.selectedBackgroundColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let selectedTintColorToken = ColorTokenGeneratedMock.random()
        let selectedBackgroundColorToken = ColorTokenGeneratedMock.random()

        let colors1 = TabAccessibilityColors(
            selectedTintColorToken: selectedTintColorToken,
            selectedBackgroundColorToken: selectedBackgroundColorToken
        )

        let colors2 = TabAccessibilityColors(
            selectedTintColorToken: selectedTintColorToken,
            selectedBackgroundColorToken: selectedBackgroundColorToken
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different selected tint color token")
    func inequalityWhenDifferentSelectedTintColorToken() {
        // GIVEN / WHEN
        let selectedTintColorToken1 = ColorTokenGeneratedMock.random()
        let selectedTintColorToken2 = ColorTokenGeneratedMock.random()
        let selectedBackgroundColorToken = ColorTokenGeneratedMock.random()

        let colors1 = TabAccessibilityColors(
            selectedTintColorToken: selectedTintColorToken1,
            selectedBackgroundColorToken: selectedBackgroundColorToken
        )

        let colors2 = TabAccessibilityColors(
            selectedTintColorToken: selectedTintColorToken2,
            selectedBackgroundColorToken: selectedBackgroundColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different selected background color token")
    func inequalityWhenDifferentSelectedBackgroundColorToken() {
        // GIVEN / WHEN
        let selectedTintColorToken = ColorTokenGeneratedMock.random()
        let selectedBackgroundColorToken1 = ColorTokenGeneratedMock.random()
        let selectedBackgroundColorToken2 = ColorTokenGeneratedMock.random()

        let colors1 = TabAccessibilityColors(
            selectedTintColorToken: selectedTintColorToken,
            selectedBackgroundColorToken: selectedBackgroundColorToken1
        )

        let colors2 = TabAccessibilityColors(
            selectedTintColorToken: selectedTintColorToken,
            selectedBackgroundColorToken: selectedBackgroundColorToken2
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
