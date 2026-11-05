//
//  RadioButtonDynamicColorsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Radio Button Dynamic Colors Tests")
struct RadioButtonDynamicColorsTests {

    // MARK: - Initialization Tests

    @Test("Init should use default values")
    func initShouldUseDefaultValues() {
        // GIVEN / WHEN
        let colors = RadioButtonDynamicColors()

        // THEN
        #expect(colors.circle.equals(ColorTokenClear()))
    }

    @Test("Init with custom values should set properties")
    func initWithCustomValuesShouldSetProperties() {
        // GIVEN
        let customCircle = ColorTokenGeneratedMock.random()

        // WHEN
        var colors = RadioButtonDynamicColors()
        colors.circle = customCircle

        // THEN
        #expect(colors.circle.equals(customCircle))
    }
}
