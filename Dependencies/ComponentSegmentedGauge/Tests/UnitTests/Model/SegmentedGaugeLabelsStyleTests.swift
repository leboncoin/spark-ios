//
//  SegmentedGaugeLabelsStyleTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

final class SegmentedGaugeLabelsStyleTests: XCTestCase {

    // MARK: - Default Values Tests

    func test_defaultInitializer_producesEqualInstances() {
        XCTAssertEqual(SegmentedGaugeLabelsStyle(), SegmentedGaugeLabelsStyle())
    }

    // MARK: - Equatable Tests

    func test_equality_whenTokensMatch() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeLabelsStyle(
            titleTypography: TypographyFontTokenGeneratedMock.mocked(
                uiFont: .boldSystemFont(ofSize: 14),
                font: .body
            ),
            descriptionTypography: TypographyFontTokenGeneratedMock.mocked(
                uiFont: .systemFont(ofSize: 14),
                font: .callout
            ),
            color: ColorTokenGeneratedMock.blue()
        )
        let rhs = SegmentedGaugeLabelsStyle(
            titleTypography: TypographyFontTokenGeneratedMock.mocked(
                uiFont: .boldSystemFont(ofSize: 14),
                font: .body
            ),
            descriptionTypography: TypographyFontTokenGeneratedMock.mocked(
                uiFont: .systemFont(ofSize: 14),
                font: .callout
            ),
            color: ColorTokenGeneratedMock.blue()
        )

        // THEN
        XCTAssertEqual(lhs, rhs)
    }

    func test_inequality_whenValuesDiffer() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeLabelsStyle(
            titleTypography: TypographyFontTokenGeneratedMock.mocked(
                uiFont: .boldSystemFont(ofSize: 14),
                font: .title
            ),
            descriptionTypography: TypographyFontTokenGeneratedMock.mocked(
                uiFont: .systemFont(ofSize: 14),
                font: .title2
            ),
            color: ColorTokenGeneratedMock.blue()
        )
        let rhs = SegmentedGaugeLabelsStyle(
            titleTypography: TypographyFontTokenGeneratedMock.mocked(
                uiFont: .boldSystemFont(ofSize: 15),
                font: .caption
            ),
            descriptionTypography: TypographyFontTokenGeneratedMock.mocked(
                uiFont: .systemFont(ofSize: 15),
                font: .caption2
            ),
            color: ColorTokenGeneratedMock.orange()
        )

        // THEN
        XCTAssertNotEqual(lhs, rhs)
    }
}
