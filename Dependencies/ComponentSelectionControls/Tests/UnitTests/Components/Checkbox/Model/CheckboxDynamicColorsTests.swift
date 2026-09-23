//
//  CheckboxDynamicColorsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class CheckboxDynamicColorsTests: XCTestCase {

    // MARK: - Initialization Tests

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let dynamicColors = CheckboxDynamicColors()

        // THEN
        XCTAssertTrue(dynamicColors.background.equals(ColorTokenClear()))
        XCTAssertTrue(dynamicColors.border.equals(ColorTokenClear()))
    }

    func test_initialization_withCustomValues_shouldUseProvidedValues() {
        // GIVEN
        let customBackground = ColorTokenGeneratedMock.random()
        let customBorder = ColorTokenGeneratedMock.random()

        // WHEN
        let dynamicColors = CheckboxDynamicColors(
            background: customBackground,
            border: customBorder
        )

        // THEN
        XCTAssertTrue(dynamicColors.background.equals(customBackground))
        XCTAssertTrue(dynamicColors.border.equals(customBorder))
    }
}
