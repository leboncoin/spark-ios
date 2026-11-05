//
//  BadgeColorsTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Badge Colors Tests")
struct BadgeColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = BadgeColors()

        // Then
        #expect(colors.background.equals(ColorTokenClear()))
        #expect(colors.border.equals(ColorTokenClear()))
        #expect(colors.foreground.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
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
        #expect(colors1 == colors2)
    }
}
