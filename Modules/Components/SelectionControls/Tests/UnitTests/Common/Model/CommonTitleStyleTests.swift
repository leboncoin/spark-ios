//
//  CommonTitleStyleTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class CommonTitleStyleTests: XCTestCase {

    // MARK: - Initialization Tests

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let titleStyle = CommonTitleStyle()

        // THEN
        XCTAssertTrue(titleStyle.typography.equals(TypographyFontTokenClear()))
        XCTAssertTrue(titleStyle.color.equals(ColorTokenClear()))
    }

    func test_initialization_withCustomValues_shouldUseProvidedValues() {
        // GIVEN
        let customTypography = TypographyFontTokenGeneratedMock()
        let customColor = ColorTokenGeneratedMock.random()

        // WHEN
        let titleStyle = CommonTitleStyle(
            typography: customTypography,
            color: customColor
        )

        // THEN
        XCTAssertTrue(titleStyle.typography.equals(customTypography))
        XCTAssertTrue(titleStyle.color.equals(customColor))
    }
}
