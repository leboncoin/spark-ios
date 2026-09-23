//
//  RadioButtonStaticColorsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class RadioButtonStaticColorsTests: XCTestCase {

    // MARK: - Initialization Tests

    func test_init_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let colors = RadioButtonStaticColors()

        // THEN
        XCTAssertTrue(colors.dot.equals(ColorTokenClear()))
        XCTAssertTrue(colors.hover.equals(ColorTokenClear()))
    }

    func test_init_withCustomValues_shouldSetProperties() {
        // GIVEN
        let customDot = ColorTokenGeneratedMock.random()
        let customHover = ColorTokenGeneratedMock.random()

        // WHEN
        var colors = RadioButtonStaticColors()
        colors.dot = customDot
        colors.hover = customHover

        // THEN
        XCTAssertTrue(colors.dot.equals(customDot))
        XCTAssertTrue(colors.hover.equals(customHover))
    }
}
