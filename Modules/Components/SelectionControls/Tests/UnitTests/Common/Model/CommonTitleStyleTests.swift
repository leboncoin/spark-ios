//
//  CommonTitleStyleTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Common Title Style Tests")
struct CommonTitleStyleTests {

    // MARK: - Initialization Tests

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let titleStyle = CommonTitleStyle()

        // THEN
        #expect(titleStyle.typography.equals(TypographyFontTokenClear()))
        #expect(titleStyle.color.equals(ColorTokenClear()))
    }

    @Test("Initialization with custom values should use provided values")
    func initializationWithCustomValuesShouldUseProvidedValues() {
        // GIVEN
        let customTypography = TypographyFontTokenGeneratedMock()
        let customColor = ColorTokenGeneratedMock.random()

        // WHEN
        let titleStyle = CommonTitleStyle(
            typography: customTypography,
            color: customColor
        )

        // THEN
        #expect(titleStyle.typography.equals(customTypography))
        #expect(titleStyle.color.equals(customColor))
    }
}
