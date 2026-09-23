//
//  DividerColorsTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@testable import SparkComponentDivider

final class DividerColorsTests: XCTestCase {

    // MARK: - Default Values Tests

    func test_init_default_values() {
        // GIVEN & WHEN
        let dividerColors = DividerColors()

        // THEN
        XCTAssertTrue(
            dividerColors.text is ColorTokenClear,
            "Default text should be ColorTokenClear"
        )
        XCTAssertTrue(
            dividerColors.separator is ColorTokenClear,
            "Default separator should be ColorTokenClear"
        )
    }

    // MARK: - Equatable Tests

    func test_equatable_same_instances() {
        // GIVEN
        let dividerColors1 = DividerColors()
        let dividerColors2 = DividerColors()

        // WHEN & THEN
        XCTAssertEqual(
            dividerColors1,
            dividerColors2,
            "Two DividerColors instances with same values should be equal"
        )
    }

    func test_equatable_different_text_colors() {
        // GIVEN
        let colors = ColorsGeneratedMock.mocked()
        var dividerColors1 = DividerColors()
        var dividerColors2 = DividerColors()

        // WHEN
        dividerColors1.text = colors.base.onSurface
        dividerColors2.text = colors.accent.onAccentContainer

        // THEN
        XCTAssertNotEqual(
            dividerColors1,
            dividerColors2,
            "DividerColors with different text colors should not be equal"
        )
    }

    func test_equatable_different_separator_colors() {
        // GIVEN
        let colors = ColorsGeneratedMock.mocked()
        var dividerColors1 = DividerColors()
        var dividerColors2 = DividerColors()

        // WHEN
        dividerColors1.separator = colors.base.outline
        dividerColors2.separator = colors.base.outlineHigh

        // THEN
        XCTAssertNotEqual(
            dividerColors1,
            dividerColors2,
            "DividerColors with different separator colors should not be equal"
        )
    }
}
