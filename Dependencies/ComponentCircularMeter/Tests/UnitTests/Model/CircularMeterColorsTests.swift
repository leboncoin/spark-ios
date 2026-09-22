//
//  CircularMeterColorsTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentCircularMeter
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Circular Meter Colors Tests")
struct CircularMeterColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = CircularMeterColors()

        // THEN
        #expect(colors.trackColorToken.equals(ColorTokenClear()))
        #expect(colors.indicatorColorToken.equals(ColorTokenClear()))
        #expect(colors.iconColorToken.equals(ColorTokenClear()))
        #expect(colors.valueColorToken.equals(ColorTokenClear()))
        #expect(colors.contentColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let trackColorToken = ColorTokenGeneratedMock.random()
        let indicatorColorToken = ColorTokenGeneratedMock.random()
        let iconColorToken = ColorTokenGeneratedMock.random()
        let valueColorToken = ColorTokenGeneratedMock.random()
        let contentColorToken = ColorTokenGeneratedMock.random()

        let colors1 = CircularMeterColors(
            trackColorToken: trackColorToken,
            indicatorColorToken: indicatorColorToken,
            iconColorToken: iconColorToken,
            valueColorToken: valueColorToken,
            contentColorToken: contentColorToken
        )

        let colors2 = CircularMeterColors(
            trackColorToken: trackColorToken,
            indicatorColorToken: indicatorColorToken,
            iconColorToken: iconColorToken,
            valueColorToken: valueColorToken,
            contentColorToken: contentColorToken
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different track color")
    func inequalityWhenDifferentTrackColor() {
        // GIVEN / WHEN
        let trackColorToken1 = ColorTokenGeneratedMock.blue()
        let trackColorToken2 = ColorTokenGeneratedMock.green()
        let indicatorColorToken = ColorTokenGeneratedMock.red()
        let iconColorToken = ColorTokenGeneratedMock.red()
        let valueColorToken = ColorTokenGeneratedMock.red()
        let contentColorToken = ColorTokenGeneratedMock.red()

        let colors1 = CircularMeterColors(
            trackColorToken: trackColorToken1,
            indicatorColorToken: indicatorColorToken,
            iconColorToken: iconColorToken,
            valueColorToken: valueColorToken,
            contentColorToken: contentColorToken
        )

        let colors2 = CircularMeterColors(
            trackColorToken: trackColorToken2,
            indicatorColorToken: indicatorColorToken,
            iconColorToken: iconColorToken,
            valueColorToken: valueColorToken,
            contentColorToken: contentColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different indicator color")
    func inequalityWhenDifferentIndicatorColor() {
        // GIVEN / WHEN
        let trackColorToken = ColorTokenGeneratedMock.red()
        let indicatorColorToken1 = ColorTokenGeneratedMock.blue()
        let indicatorColorToken2 = ColorTokenGeneratedMock.green()
        let iconColorToken = ColorTokenGeneratedMock.red()
        let valueColorToken = ColorTokenGeneratedMock.red()
        let contentColorToken = ColorTokenGeneratedMock.red()

        let colors1 = CircularMeterColors(
            trackColorToken: trackColorToken,
            indicatorColorToken: indicatorColorToken1,
            iconColorToken: iconColorToken,
            valueColorToken: valueColorToken,
            contentColorToken: contentColorToken
        )

        let colors2 = CircularMeterColors(
            trackColorToken: trackColorToken,
            indicatorColorToken: indicatorColorToken2,
            iconColorToken: iconColorToken,
            valueColorToken: valueColorToken,
            contentColorToken: contentColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different icon color")
    func inequalityWhenDifferentIconColor() {
        // GIVEN / WHEN
        let trackColorToken = ColorTokenGeneratedMock.red()
        let indicatorColorToken = ColorTokenGeneratedMock.red()
        let iconColorToken1 = ColorTokenGeneratedMock.blue()
        let iconColorToken2 = ColorTokenGeneratedMock.green()
        let valueColorToken = ColorTokenGeneratedMock.red()
        let contentColorToken = ColorTokenGeneratedMock.red()

        let colors1 = CircularMeterColors(
            trackColorToken: trackColorToken,
            indicatorColorToken: indicatorColorToken,
            iconColorToken: iconColorToken1,
            valueColorToken: valueColorToken,
            contentColorToken: contentColorToken
        )

        let colors2 = CircularMeterColors(
            trackColorToken: trackColorToken,
            indicatorColorToken: indicatorColorToken,
            iconColorToken: iconColorToken2,
            valueColorToken: valueColorToken,
            contentColorToken: contentColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different value color")
    func inequalityWhenDifferentValueColor() {
        // GIVEN / WHEN
        let trackColorToken = ColorTokenGeneratedMock.red()
        let indicatorColorToken = ColorTokenGeneratedMock.red()
        let iconColorToken = ColorTokenGeneratedMock.red()
        let valueColorToken1 = ColorTokenGeneratedMock.blue()
        let valueColorToken2 = ColorTokenGeneratedMock.green()
        let contentColorToken = ColorTokenGeneratedMock.red()

        let colors1 = CircularMeterColors(
            trackColorToken: trackColorToken,
            indicatorColorToken: indicatorColorToken,
            iconColorToken: iconColorToken,
            valueColorToken: valueColorToken1,
            contentColorToken: contentColorToken
        )

        let colors2 = CircularMeterColors(
            trackColorToken: trackColorToken,
            indicatorColorToken: indicatorColorToken,
            iconColorToken: iconColorToken,
            valueColorToken: valueColorToken2,
            contentColorToken: contentColorToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different content color")
    func inequalityWhenDifferentContentColor() {
        // GIVEN / WHEN
        let trackColorToken = ColorTokenGeneratedMock.red()
        let indicatorColorToken = ColorTokenGeneratedMock.red()
        let iconColorToken = ColorTokenGeneratedMock.red()
        let valueColorToken = ColorTokenGeneratedMock.red()
        let contentColorToken1 = ColorTokenGeneratedMock.blue()
        let contentColorToken2 = ColorTokenGeneratedMock.green()

        let colors1 = CircularMeterColors(
            trackColorToken: trackColorToken,
            indicatorColorToken: indicatorColorToken,
            iconColorToken: iconColorToken,
            valueColorToken: valueColorToken,
            contentColorToken: contentColorToken1
        )

        let colors2 = CircularMeterColors(
            trackColorToken: trackColorToken,
            indicatorColorToken: indicatorColorToken,
            iconColorToken: iconColorToken,
            valueColorToken: valueColorToken,
            contentColorToken: contentColorToken2
        )

        // THEN
        #expect(colors1 != colors2)
    }
}
