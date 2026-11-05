//
//  RadioButtonStaticColorsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Radio Button Static Colors Tests")
struct RadioButtonStaticColorsTests {

    // MARK: - Initialization Tests

    @Test("Init should use default values")
    func initShouldUseDefaultValues() {
        // GIVEN / WHEN
        let colors = RadioButtonStaticColors()

        // THEN
        #expect(colors.dot.equals(ColorTokenClear()))
        #expect(colors.hover.equals(ColorTokenClear()))
    }

    @Test("Init with custom values should set properties")
    func initWithCustomValuesShouldSetProperties() {
        // GIVEN
        let customDot = ColorTokenGeneratedMock.random()
        let customHover = ColorTokenGeneratedMock.random()

        // WHEN
        var colors = RadioButtonStaticColors()
        colors.dot = customDot
        colors.hover = customHover

        // THEN
        #expect(colors.dot.equals(customDot))
        #expect(colors.hover.equals(customHover))
    }
}
