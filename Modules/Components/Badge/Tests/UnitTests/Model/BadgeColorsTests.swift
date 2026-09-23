//
//  BadgeColorsTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class BadgeColorsTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let colors = BadgeColors()

        // Then
        XCTAssertTrue(colors.background.equals(ColorTokenClear()))
        XCTAssertTrue(colors.border.equals(ColorTokenClear()))
        XCTAssertTrue(colors.foreground.equals(ColorTokenClear()))
    }

    func test_equality_when_same_colors() {
        // GIVEN / WHEN
        let backgroundToken = ColorTokenGeneratedMock.random()
        let borderToken = ColorTokenGeneratedMock.random()
        let foregroundToken = ColorTokenGeneratedMock.random()

        let colors1 = BadgeColors(
            background: backgroundToken,
            border: borderToken,
            foreground: foregroundToken
        )

        let colors2 = BadgeColors(
            background: backgroundToken,
            border: borderToken,
            foreground: foregroundToken
        )

        // THEN
        XCTAssertEqual(colors1, colors2)
    }
}
