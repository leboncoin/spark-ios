//
//  TabContentColorsTests.swift
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

@Suite("Tab Content Colors Tests")
struct TabContentColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = TabContentColors()

        // THEN
        #expect(colors.tintColorToken.equals(ColorTokenClear()))
        #expect(colors.backgroundColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let tintColorToken = ColorTokenGeneratedMock.random()
        let backgroundColorToken = ColorTokenGeneratedMock.random()

        let colors1 = TabContentColors(
            tintColorToken: tintColorToken,
            backgroundColorToken: backgroundColorToken
        )

        let colors2 = TabContentColors(
            tintColorToken: tintColorToken,
            backgroundColorToken: backgroundColorToken
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

        let colors1 = TabContentColors(
            tintColorToken: tintColorToken1,
            backgroundColorToken: backgroundColorToken
        )

        let colors2 = TabContentColors(
            tintColorToken: tintColorToken2,
            backgroundColorToken: backgroundColorToken
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

        let colors1 = TabContentColors(
            tintColorToken: tintColorToken,
            backgroundColorToken: backgroundColorToken1
        )

        let colors2 = TabContentColors(
            tintColorToken: tintColorToken,
            backgroundColorToken: backgroundColorToken2
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
