//
//  ChipColorsTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ChipColorsTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let colors = ChipColors()

        // Then
        XCTAssertTrue(colors.background.equals(ColorTokenClear()))
        XCTAssertTrue(colors.border.equals(ColorTokenClear()))
        XCTAssertTrue(colors.content.equals(ColorTokenClear()))
    }

    func test_equality_when_same_colors() {
        // GIVEN / WHEN
        let backgroundToken = ColorTokenGeneratedMock.random()
        let borderToken = ColorTokenGeneratedMock.random()
        let contentToken = ColorTokenGeneratedMock.random()

        let colors1 = ChipColors(
            background: backgroundToken,
            border: borderToken,
            content: contentToken
        )

        let colors2 = ChipColors(
            background: backgroundToken,
            border: borderToken,
            content: contentToken
        )

        // THEN
        XCTAssertEqual(colors1, colors2)
    }
}
