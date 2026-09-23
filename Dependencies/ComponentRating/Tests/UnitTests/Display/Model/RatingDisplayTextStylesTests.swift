//
//  RatingDisplayTextStylesTests.swift
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

final class RatingDisplayTextStylesTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let textStyles = RatingDisplayTextStyles()

        // THEN
        XCTAssertEqual(textStyles.value, RatingDisplayTextStyle())
        XCTAssertEqual(textStyles.count, RatingDisplayTextStyle())
        XCTAssertEqual(textStyles.additional, RatingDisplayTextStyle())
    }

    func test_equality_when_same_properties() {
        // GIVEN / WHEN
        let valueStyle = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(),
            colorToken: ColorTokenGeneratedMock.random()
        )
        let countStyle = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(.title),
            colorToken: ColorTokenGeneratedMock.blue()
        )
        let additionalStyle = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(.body),
            colorToken: ColorTokenGeneratedMock.red()
        )

        let textStyles1 = RatingDisplayTextStyles(
            value: valueStyle,
            count: countStyle,
            additional: additionalStyle
        )

        let textStyles2 = RatingDisplayTextStyles(
            value: valueStyle,
            count: countStyle,
            additional: additionalStyle
        )

        // THEN
        XCTAssertEqual(textStyles1, textStyles2)
    }

    func test_inequality_when_different_value_style() {
        // GIVEN / WHEN
        let valueStyle1 = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(),
            colorToken: ColorTokenGeneratedMock.random()
        )
        let valueStyle2 = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(.title),
            colorToken: ColorTokenGeneratedMock.random()
        )
        let countStyle = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(.body),
            colorToken: ColorTokenGeneratedMock.blue()
        )
        let additionalStyle = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(.caption),
            colorToken: ColorTokenGeneratedMock.red()
        )

        let textStyles1 = RatingDisplayTextStyles(
            value: valueStyle1,
            count: countStyle,
            additional: additionalStyle
        )

        let textStyles2 = RatingDisplayTextStyles(
            value: valueStyle2,
            count: countStyle,
            additional: additionalStyle
        )

        // THEN
        XCTAssertNotEqual(textStyles1, textStyles2)
    }

    func test_inequality_when_different_count_style() {
        // GIVEN / WHEN
        let valueStyle = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(),
            colorToken: ColorTokenGeneratedMock.random()
        )
        let countStyle1 = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(.title),
            colorToken: ColorTokenGeneratedMock.blue()
        )
        let countStyle2 = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(.body),
            colorToken: ColorTokenGeneratedMock.blue()
        )
        let additionalStyle = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(.caption),
            colorToken: ColorTokenGeneratedMock.red()
        )

        let textStyles1 = RatingDisplayTextStyles(
            value: valueStyle,
            count: countStyle1,
            additional: additionalStyle
        )

        let textStyles2 = RatingDisplayTextStyles(
            value: valueStyle,
            count: countStyle2,
            additional: additionalStyle
        )

        // THEN
        XCTAssertNotEqual(textStyles1, textStyles2)
    }

    func test_inequality_when_different_additional_style() {
        // GIVEN / WHEN
        let valueStyle = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(),
            colorToken: ColorTokenGeneratedMock.random()
        )
        let countStyle = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(.title),
            colorToken: ColorTokenGeneratedMock.blue()
        )
        let additionalStyle1 = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(.body),
            colorToken: ColorTokenGeneratedMock.red()
        )
        let additionalStyle2 = RatingDisplayTextStyle(
            fontToken: TypographyFontTokenGeneratedMock.mocked(.caption),
            colorToken: ColorTokenGeneratedMock.red()
        )

        let textStyles1 = RatingDisplayTextStyles(
            value: valueStyle,
            count: countStyle,
            additional: additionalStyle1
        )

        let textStyles2 = RatingDisplayTextStyles(
            value: valueStyle,
            count: countStyle,
            additional: additionalStyle2
        )

        // THEN
        XCTAssertNotEqual(textStyles1, textStyles2)
    }
}
