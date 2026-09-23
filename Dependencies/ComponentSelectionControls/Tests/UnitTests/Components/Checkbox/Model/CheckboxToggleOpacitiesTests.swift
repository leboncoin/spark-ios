//
//  CheckboxToggleOpacitiesTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class CheckboxToggleOpacitiesTests: XCTestCase {

    // MARK: - Initialization Tests

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let opacities = CheckboxToggleOpacities()

        // THEN
        XCTAssertEqual(opacities.background, 0)
        XCTAssertEqual(opacities.border, 0)
    }

    func test_initialization_withCustomValues_shouldUseProvidedValues() {
        // GIVEN
        let customBackground: CGFloat = 3
        let customBorder: CGFloat = 4

        // WHEN
        let opacities = CheckboxToggleOpacities(
            background: customBackground,
            border: customBorder
        )

        // THEN
        XCTAssertEqual(opacities.background, customBackground)
        XCTAssertEqual(opacities.border, customBorder)
    }
}
