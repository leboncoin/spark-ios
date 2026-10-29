//
//  RatingDisplayTextStylesTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 14/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Rating Display Text Styles Tests")
struct RatingDisplayTextStylesTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let textStyles = RatingDisplayTextStyles()

        // THEN
        #expect(textStyles.value == RatingDisplayTextStyle())
        #expect(textStyles.count == RatingDisplayTextStyle())
        #expect(textStyles.additional == RatingDisplayTextStyle())
    }

    @Test("Equality when same properties")
    func equalityWhenSameProperties() {
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
        #expect(textStyles1 == textStyles2)
    }

    @Test("Inequality when different value style")
    func inequalityWhenDifferentValueStyle() {
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
        #expect(textStyles1 != textStyles2)
    }

    @Test("Inequality when different count style")
    func inequalityWhenDifferentCountStyle() {
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
        #expect(textStyles1 != textStyles2)
    }

    @Test("Inequality when different additional style")
    func inequalityWhenDifferentAdditionalStyle() {
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
        #expect(textStyles1 != textStyles2)
    }
}
