//
//  ToggleStaticColorsTests.swift
//  SparkComponentSelectionControlsSnapshotTests
//
//  Created by robin.lemaire on 28/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) @testable import SparkTheming

final class ToggleStaticColorsTests: XCTestCase {

    // MARK: - Tests

    func test_defaultValues() {
        // GIVEN / WHEN
        let colors = ToggleStaticColors()

        // THEN
        XCTAssertTrue(colors.dotBackground.equals(ColorTokenClear()))
        XCTAssertTrue(colors.hover.equals(ColorTokenClear()))
    }
}
