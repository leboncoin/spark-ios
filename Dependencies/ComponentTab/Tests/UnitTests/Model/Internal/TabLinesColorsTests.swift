//
//  TabLinesColorsTests.swift
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

@Suite("Tab Lines Colors Tests")
struct TabLinesColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = TabLinesColors()

        // THEN
        #expect(colors.colorToken.equals(ColorTokenClear()))
        #expect(colors.selectedColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let colorToken = ColorTokenGeneratedMock.random()
        let selectedColorToken = ColorTokenGeneratedMock.random()

        let colors1 = TabLinesColors(
            colorToken: colorToken,
            selectedColorToken: selectedColorToken
        )

        let colors2 = TabLinesColors(
            colorToken: colorToken,
            selectedColorToken: selectedColorToken
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different color token")
    func inequalityWhenDifferentColorToken() {
        // GIVEN / WHEN
        let colorToken1 = ColorTokenGeneratedMock.random()
        let colorToken2 = ColorTokenGeneratedMock.random()
        let selectedColorToken = ColorTokenGeneratedMock.random()

        let colors1 = TabLinesColors(
            colorToken: colorToken1,
            selectedColorToken: selectedColorToken
        )

        let colors2 = TabLinesColors(
            colorToken: colorToken2,
            selectedColorToken: selectedColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different selected color token")
    func inequalityWhenDifferentSelectedColorToken() {
        // GIVEN / WHEN
        let colorToken = ColorTokenGeneratedMock.random()
        let selectedColorToken1 = ColorTokenGeneratedMock.random()
        let selectedColorToken2 = ColorTokenGeneratedMock.random()

        let colors1 = TabLinesColors(
            colorToken: colorToken,
            selectedColorToken: selectedColorToken1
        )

        let colors2 = TabLinesColors(
            colorToken: colorToken,
            selectedColorToken: selectedColorToken2
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
