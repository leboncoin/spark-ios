//
//  SegmentedControlItemColorsTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("SegmentedControl Item Colors Tests")
struct SegmentedControlItemColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = SegmentedControlItemColors()

        // THEN
        #expect(colors.backgroundColorToken.equals(ColorTokenClear()))
        #expect(colors.contentColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let backgroundToken = ColorTokenGeneratedMock.random()
        let contentToken = ColorTokenGeneratedMock.random()

        let colors1 = SegmentedControlItemColors(
            backgroundColorToken: backgroundToken,
            contentColorToken: contentToken
        )

        let colors2 = SegmentedControlItemColors(
            backgroundColorToken: backgroundToken,
            contentColorToken: contentToken
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different background color")
    func inequalityWhenDifferentBackgroundColor() {
        // GIVEN / WHEN
        let contentToken = ColorTokenGeneratedMock.random()

        let colors1 = SegmentedControlItemColors(
            backgroundColorToken: ColorTokenGeneratedMock.random(),
            contentColorToken: contentToken
        )

        let colors2 = SegmentedControlItemColors(
            backgroundColorToken: ColorTokenGeneratedMock.random(),
            contentColorToken: contentToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different content color")
    func inequalityWhenDifferentContentColor() {
        // GIVEN / WHEN
        let backgroundToken = ColorTokenGeneratedMock.random()

        let colors1 = SegmentedControlItemColors(
            backgroundColorToken: backgroundToken,
            contentColorToken: ColorTokenGeneratedMock.random()
        )

        let colors2 = SegmentedControlItemColors(
            backgroundColorToken: backgroundToken,
            contentColorToken: ColorTokenGeneratedMock.random()
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
