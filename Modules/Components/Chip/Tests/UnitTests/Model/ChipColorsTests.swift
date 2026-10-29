//
//  ChipColorsTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Chip Colors Tests")
struct ChipColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = ChipColors()

        // Then
        #expect(colors.background.equals(ColorTokenClear()))
        #expect(colors.border.equals(ColorTokenClear()))
        #expect(colors.content.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
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
        #expect(colors1 == colors2)
    }
}
