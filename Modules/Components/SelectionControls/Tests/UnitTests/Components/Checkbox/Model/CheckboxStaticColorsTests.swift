//
//  CheckboxStaticColorsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Checkbox Static Colors Tests")
struct CheckboxStaticColorsTests {

    // MARK: - Initialization Tests

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let staticColors = CheckboxStaticColors()

        // THEN
        #expect(staticColors.iconForeground.equals(ColorTokenClear()))
        #expect(staticColors.hover.equals(ColorTokenClear()))
    }

    @Test("Initialization with custom values should use provided values")
    func initializationWithCustomValuesShouldUseProvidedValues() {
        // GIVEN
        let customIconForeground = ColorTokenGeneratedMock.random()
        let customHover = ColorTokenGeneratedMock.random()

        // WHEN
        let staticColors = CheckboxStaticColors(
            iconForeground: customIconForeground,
            hover: customHover
        )

        // THEN
        #expect(staticColors.iconForeground.equals(customIconForeground))
        #expect(staticColors.hover.equals(customHover))
    }
}
