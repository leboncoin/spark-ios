//
//  SliderColorsTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Slider Colors Tests")
struct SliderColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = SliderColors()

        // THEN
        #expect(colors.tintColorToken.equals(ColorTokenClear()))
        #expect(colors.titleColorToken.equals(ColorTokenClear()))
        #expect(colors.valueColorToken.equals(ColorTokenClear()))
        #expect(colors.rangeValuesColorToken.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let tintToken = ColorTokenGeneratedMock.random()
        let titleToken = ColorTokenGeneratedMock.random()
        let valueToken = ColorTokenGeneratedMock.random()
        let rangeValuesToken = ColorTokenGeneratedMock.random()

        let colors1 = SliderColors(
            tintColorToken: tintToken,
            titleColorToken: titleToken,
            valueColorToken: valueToken,
            rangeValuesColorToken: rangeValuesToken
        )

        let colors2 = SliderColors(
            tintColorToken: tintToken,
            titleColorToken: titleToken,
            valueColorToken: valueToken,
            rangeValuesColorToken: rangeValuesToken
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different tint colors")
    func inequalityWhenDifferentTintColors() {
        // GIVEN / WHEN
        let tintToken1 = ColorTokenGeneratedMock.random()
        let tintToken2 = ColorTokenGeneratedMock.random()
        let titleToken = ColorTokenGeneratedMock.random()
        let valueToken = ColorTokenGeneratedMock.random()
        let rangeValuesToken = ColorTokenGeneratedMock.random()

        let colors1 = SliderColors(
            tintColorToken: tintToken1,
            titleColorToken: titleToken,
            valueColorToken: valueToken,
            rangeValuesColorToken: rangeValuesToken
        )

        let colors2 = SliderColors(
            tintColorToken: tintToken2,
            titleColorToken: titleToken,
            valueColorToken: valueToken,
            rangeValuesColorToken: rangeValuesToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different title colors")
    func inequalityWhenDifferentTitleColors() {
        // GIVEN / WHEN
        let tintToken = ColorTokenGeneratedMock.random()
        let titleToken1 = ColorTokenGeneratedMock.random()
        let titleToken2 = ColorTokenGeneratedMock.random()
        let valueToken = ColorTokenGeneratedMock.random()
        let rangeValuesToken = ColorTokenGeneratedMock.random()

        let colors1 = SliderColors(
            tintColorToken: tintToken,
            titleColorToken: titleToken1,
            valueColorToken: valueToken,
            rangeValuesColorToken: rangeValuesToken
        )

        let colors2 = SliderColors(
            tintColorToken: tintToken,
            titleColorToken: titleToken2,
            valueColorToken: valueToken,
            rangeValuesColorToken: rangeValuesToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different value colors")
    func inequalityWhenDifferentValueColors() {
        // GIVEN / WHEN
        let tintToken = ColorTokenGeneratedMock.random()
        let titleToken = ColorTokenGeneratedMock.random()
        let valueToken1 = ColorTokenGeneratedMock.random()
        let valueToken2 = ColorTokenGeneratedMock.random()
        let rangeValuesToken = ColorTokenGeneratedMock.random()

        let colors1 = SliderColors(
            tintColorToken: tintToken,
            titleColorToken: titleToken,
            valueColorToken: valueToken1,
            rangeValuesColorToken: rangeValuesToken
        )

        let colors2 = SliderColors(
            tintColorToken: tintToken,
            titleColorToken: titleToken,
            valueColorToken: valueToken2,
            rangeValuesColorToken: rangeValuesToken
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different range values colors")
    func inequalityWhenDifferentRangeValuesColors() {
        // GIVEN / WHEN
        let tintToken = ColorTokenGeneratedMock.random()
        let titleToken = ColorTokenGeneratedMock.random()
        let valueToken = ColorTokenGeneratedMock.random()
        let rangeValuesToken1 = ColorTokenGeneratedMock.random()
        let rangeValuesToken2 = ColorTokenGeneratedMock.random()

        let colors1 = SliderColors(
            tintColorToken: tintToken,
            titleColorToken: titleToken,
            valueColorToken: valueToken,
            rangeValuesColorToken: rangeValuesToken1
        )

        let colors2 = SliderColors(
            tintColorToken: tintToken,
            titleColorToken: titleToken,
            valueColorToken: valueToken,
            rangeValuesColorToken: rangeValuesToken2
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Hash consistency")
    func hashConsistency() {
        // GIVEN / WHEN
        let tintToken = ColorTokenGeneratedMock.random()
        let titleToken = ColorTokenGeneratedMock.random()
        let valueToken = ColorTokenGeneratedMock.random()
        let rangeValuesToken = ColorTokenGeneratedMock.random()

        let colors = SliderColors(
            tintColorToken: tintToken,
            titleColorToken: titleToken,
            valueColorToken: valueToken,
            rangeValuesColorToken: rangeValuesToken
        )

        var hasher1 = Hasher()
        colors.hash(into: &hasher1)
        let hash1 = hasher1.finalize()

        var hasher2 = Hasher()
        colors.hash(into: &hasher2)
        let hash2 = hasher2.finalize()

        // THEN
        #expect(hash1 == hash2)
    }
}
