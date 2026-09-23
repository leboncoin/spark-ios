//
//  SliderTypographiesTests.swift
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

final class SliderTypographiesTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let typographies = SliderTypographies()

        // THEN
        XCTAssertTrue(typographies.titleFontToken.equals(TypographyFontTokenClear()))
        XCTAssertTrue(typographies.valueFontToken.equals(TypographyFontTokenClear()))
        XCTAssertTrue(typographies.rangeValuesFontToken.equals(TypographyFontTokenClear()))
    }

    func test_equality_when_same_typographies() {
        // GIVEN / WHEN
        let titleFontToken = TypographyFontTokenGeneratedMock.title()
        let valueFontToken = TypographyFontTokenGeneratedMock.body()
        let rangeValuesFontToken = TypographyFontTokenGeneratedMock.footnote()

        let typographies1 = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken
        )

        let typographies2 = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken
        )

        // THEN
        XCTAssertEqual(typographies1, typographies2)
    }

    func test_inequality_when_different_title_font() {
        // GIVEN / WHEN
        let titleFontToken1 = TypographyFontTokenGeneratedMock.title()
        let titleFontToken2 = TypographyFontTokenGeneratedMock.headline()
        let valueFontToken = TypographyFontTokenGeneratedMock.body()
        let rangeValuesFontToken = TypographyFontTokenGeneratedMock.footnote()

        let typographies1 = SliderTypographies(
            titleFontToken: titleFontToken1,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken
        )

        let typographies2 = SliderTypographies(
            titleFontToken: titleFontToken2,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken
        )

        // THEN
        XCTAssertNotEqual(typographies1, typographies2)
    }

    func test_inequality_when_different_value_font() {
        // GIVEN / WHEN
        let titleFontToken = TypographyFontTokenGeneratedMock.title()
        let valueFontToken1 = TypographyFontTokenGeneratedMock.body()
        let valueFontToken2 = TypographyFontTokenGeneratedMock.footnote()
        let rangeValuesFontToken = TypographyFontTokenGeneratedMock.callout()

        let typographies1 = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken1,
            rangeValuesFontToken: rangeValuesFontToken
        )

        let typographies2 = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken2,
            rangeValuesFontToken: rangeValuesFontToken
        )

        // THEN
        XCTAssertNotEqual(typographies1, typographies2)
    }

    func test_inequality_when_different_rangeValues_font() {
        // GIVEN / WHEN
        let titleFontToken = TypographyFontTokenGeneratedMock.title()
        let valueFontToken = TypographyFontTokenGeneratedMock.body()
        let rangeValuesFontToken1 = TypographyFontTokenGeneratedMock.footnote()
        let rangeValuesFontToken2 = TypographyFontTokenGeneratedMock.callout()

        let typographies1 = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken1
        )

        let typographies2 = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken2
        )

        // THEN
        XCTAssertNotEqual(typographies1, typographies2)
    }

    func test_hash_consistency() {
        // GIVEN / WHEN
        let titleFontToken = TypographyFontTokenGeneratedMock.title()
        let valueFontToken = TypographyFontTokenGeneratedMock.body()
        let rangeValuesFontToken = TypographyFontTokenGeneratedMock.footnote()

        let typographies = SliderTypographies(
            titleFontToken: titleFontToken,
            valueFontToken: valueFontToken,
            rangeValuesFontToken: rangeValuesFontToken
        )

        var hasher1 = Hasher()
        typographies.hash(into: &hasher1)
        let hash1 = hasher1.finalize()

        var hasher2 = Hasher()
        typographies.hash(into: &hasher2)
        let hash2 = hasher2.finalize()

        // THEN
        XCTAssertEqual(hash1, hash2)
    }
}
