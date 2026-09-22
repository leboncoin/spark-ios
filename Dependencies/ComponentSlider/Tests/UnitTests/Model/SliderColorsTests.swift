//
//  SliderColorsTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class SliderColorsTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let colors = SliderColors()

        // THEN
        XCTAssertTrue(colors.tintColorToken.equals(ColorTokenClear()))
        XCTAssertTrue(colors.titleColorToken.equals(ColorTokenClear()))
        XCTAssertTrue(colors.valueColorToken.equals(ColorTokenClear()))
        XCTAssertTrue(colors.rangeValuesColorToken.equals(ColorTokenClear()))
    }

    func test_equality_when_same_colors() {
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
        XCTAssertEqual(colors1, colors2)
    }

    func test_inequality_when_different_tint_colors() {
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
        XCTAssertNotEqual(colors1, colors2)
    }

    func test_inequality_when_different_title_colors() {
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
        XCTAssertNotEqual(colors1, colors2)
    }

    func test_inequality_when_different_value_colors() {
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
        XCTAssertNotEqual(colors1, colors2)
    }

    func test_inequality_when_different_rangeValues_colors() {
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
        XCTAssertNotEqual(colors1, colors2)
    }

    func test_hash_consistency() {
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
        XCTAssertEqual(hash1, hash2)
    }
}
