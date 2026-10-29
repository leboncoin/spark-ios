//
//  SegmentedGaugeLabelsStyleTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

@Suite("SegmentedGauge Labels Style Tests")
struct SegmentedGaugeLabelsStyleTests {

    // MARK: - Default Values Tests

    @Test("Default initializer produces equal instances")
    func defaultInitializerProducesEqualInstances() {
        #expect(SegmentedGaugeLabelsStyle() == SegmentedGaugeLabelsStyle())
    }

    // MARK: - Equatable Tests

    @Test("Equality when tokens match")
    func equalityWhenTokensMatch() {
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
        #expect(lhs == rhs)
    }

    @Test("Inequality when values differ")
    func inequalityWhenValuesDiffer() {
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
        #expect(lhs != rhs)
    }
}
