//
//  CheckboxDynamicColorsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Checkbox Dynamic Colors Tests")
struct CheckboxDynamicColorsTests {

    // MARK: - Initialization Tests

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let dynamicColors = CheckboxDynamicColors()

        // THEN
        #expect(dynamicColors.background.equals(ColorTokenClear()))
        #expect(dynamicColors.border.equals(ColorTokenClear()))
    }

    @Test("Initialization with custom values should use provided values")
    func initializationWithCustomValuesShouldUseProvidedValues() {
        // GIVEN
        let customBackground = ColorTokenGeneratedMock.random()
        let customBorder = ColorTokenGeneratedMock.random()

        // WHEN
        let dynamicColors = CheckboxDynamicColors(
            background: customBackground,
            border: customBorder
        )

        // THEN
        #expect(dynamicColors.background.equals(customBackground))
        #expect(dynamicColors.border.equals(customBorder))
    }
}
