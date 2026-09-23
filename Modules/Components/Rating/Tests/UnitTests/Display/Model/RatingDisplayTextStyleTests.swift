//
//  RatingDisplayTextStyleTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 14/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class RatingDisplayTextStyleTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let textStyle = RatingDisplayTextStyle()

        // THEN
        XCTAssertTrue(textStyle.fontToken.equals(TypographyFontTokenClear()))
        XCTAssertTrue(textStyle.colorToken.equals(ColorTokenClear()))
    }

    func test_equality_when_same_properties() {
        // GIVEN / WHEN
        let fontToken = TypographyFontTokenGeneratedMock.mocked()
        let colorToken = ColorTokenGeneratedMock.random()

        let textStyle1 = RatingDisplayTextStyle(
            fontToken: fontToken,
            colorToken: colorToken
        )

        let textStyle2 = RatingDisplayTextStyle(
            fontToken: fontToken,
            colorToken: colorToken
        )

        // THEN
        XCTAssertEqual(textStyle1, textStyle2)
    }

    func test_inequality_when_different_font_token() {
        // GIVEN / WHEN
        let fontToken1 = TypographyFontTokenGeneratedMock.mocked()
        let fontToken2 = TypographyFontTokenGeneratedMock.mocked(.title)
        let colorToken = ColorTokenGeneratedMock.random()

        let textStyle1 = RatingDisplayTextStyle(
            fontToken: fontToken1,
            colorToken: colorToken
        )

        let textStyle2 = RatingDisplayTextStyle(
            fontToken: fontToken2,
            colorToken: colorToken
        )

        // THEN
        XCTAssertNotEqual(textStyle1, textStyle2)
    }

    func test_inequality_when_different_color_token() {
        // GIVEN / WHEN
        let fontToken = TypographyFontTokenGeneratedMock.mocked()
        let colorToken1 = ColorTokenGeneratedMock.random()
        let colorToken2 = ColorTokenGeneratedMock.random()

        let textStyle1 = RatingDisplayTextStyle(
            fontToken: fontToken,
            colorToken: colorToken1
        )

        let textStyle2 = RatingDisplayTextStyle(
            fontToken: fontToken,
            colorToken: colorToken2
        )

        // THEN
        XCTAssertNotEqual(textStyle1, textStyle2)
    }

    func test_hash_consistency() {
        // GIVEN
        let fontToken = TypographyFontTokenGeneratedMock.mocked()
        let colorToken = ColorTokenGeneratedMock.random()

        let textStyle1 = RatingDisplayTextStyle(
            fontToken: fontToken,
            colorToken: colorToken
        )

        let textStyle2 = RatingDisplayTextStyle(
            fontToken: fontToken,
            colorToken: colorToken
        )

        // WHEN
        var hasher1 = Hasher()
        textStyle1.hash(into: &hasher1)
        let hash1 = hasher1.finalize()

        var hasher2 = Hasher()
        textStyle2.hash(into: &hasher2)
        let hash2 = hasher2.finalize()

        // THEN
        XCTAssertEqual(hash1, hash2)
    }
}
