//
//  CheckboxStaticColorsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class CheckboxStaticColorsTests: XCTestCase {

    // MARK: - Initialization Tests

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let staticColors = CheckboxStaticColors()

        // THEN
        XCTAssertTrue(staticColors.iconForeground.equals(ColorTokenClear()))
        XCTAssertTrue(staticColors.hover.equals(ColorTokenClear()))
    }

    func test_initialization_withCustomValues_shouldUseProvidedValues() {
        // GIVEN
        let customIconForeground = ColorTokenGeneratedMock.random()
        let customHover = ColorTokenGeneratedMock.random()

        // WHEN
        let staticColors = CheckboxStaticColors(
            iconForeground: customIconForeground,
            hover: customHover
        )

        // THEN
        XCTAssertTrue(staticColors.iconForeground.equals(customIconForeground))
        XCTAssertTrue(staticColors.hover.equals(customHover))
    }
}
