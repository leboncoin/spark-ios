//
//  RadioButtonDynamicColorsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class RadioButtonDynamicColorsTests: XCTestCase {

    // MARK: - Initialization Tests

    func test_init_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let colors = RadioButtonDynamicColors()

        // THEN
        XCTAssertTrue(colors.circle.equals(ColorTokenClear()))
    }

    func test_init_withCustomValues_shouldSetProperties() {
        // GIVEN
        let customCircle = ColorTokenGeneratedMock.random()

        // WHEN
        var colors = RadioButtonDynamicColors()
        colors.circle = customCircle

        // THEN
        XCTAssertTrue(colors.circle.equals(customCircle))
    }
}
