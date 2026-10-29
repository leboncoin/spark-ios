//
//  SegmentedGaugeTypeTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting

@Suite("SegmentedGauge Type Tests")
struct SegmentedGaugeTypeTests {

    // MARK: - Tests

    @Test("Default is medium")
    func defaultIsMedium() {
        #expect(
            SegmentedGaugeType.default == .noData
        )
    }

    // MARK: - Initialization Tests

    @Test("Init raw value very low")
    func initRawValueVeryLow() {
        // WHEN
        let result = SegmentedGaugeType(rawValue: 1)

        // THEN
        #expect(result == .veryLow)
    }

    @Test("Init raw value low")
    func initRawValueLow() {
        // WHEN
        let result = SegmentedGaugeType(rawValue: 2)

        // THEN
        #expect(result == .low)
    }

    @Test("Init raw value medium")
    func initRawValueMedium() {
        // WHEN
        let result = SegmentedGaugeType(rawValue: 3)

        // THEN
        #expect(result == .medium)
    }

    @Test("Init raw value high")
    func initRawValueHigh() {
        // WHEN
        let result = SegmentedGaugeType(rawValue: 4)

        // THEN
        #expect(result == .high)
    }

    @Test("Init raw value very high")
    func initRawValueVeryHigh() {
        // WHEN
        let result = SegmentedGaugeType(rawValue: 5)

        // THEN
        #expect(result == .veryHigh)
    }

    @Test("Init raw value very high large value")
    func initRawValueVeryHighLargeValue() {
        // WHEN
        let result = SegmentedGaugeType(rawValue: 10)

        // THEN
        #expect(result == .veryHigh)
    }

    @Test("Init raw value no data zero")
    func initRawValueNoDataZero() {
        // WHEN
        let result = SegmentedGaugeType(rawValue: 0)

        // THEN
        #expect(result == .noData)
    }

    @Test("Init raw value no data negative value")
    func initRawValueNoDataNegativeValue() {
        // WHEN
        let result = SegmentedGaugeType(rawValue: -1)

        // THEN
        #expect(result == .noData)
    }

    // MARK: - Equatable Tests

    @Test("Standard cases equality")
    func standardCasesEquality() {
        #expect(SegmentedGaugeType.veryHigh == .veryHigh)
        #expect(SegmentedGaugeType.high == .high)
        #expect(SegmentedGaugeType.medium == .medium)
        #expect(SegmentedGaugeType.low == .low)
        #expect(SegmentedGaugeType.veryLow == .veryLow)
        #expect(SegmentedGaugeType.noData == .noData)
    }

    @Test("Standard cases inequality")
    func standardCasesInequality() {
        #expect(SegmentedGaugeType.high != .low)
        #expect(SegmentedGaugeType.veryHigh != .noData)
    }

    @Test("Custom equality when values match")
    func customEqualityWhenValuesMatch() {
        // GIVEN
        let color = ColorTokenGeneratedMock.blue()

        // WHEN
        let lhs = SegmentedGaugeType.custom(
            level: 2,
            colorToken: color,
            dim: 0.4
        )
        let rhs = SegmentedGaugeType.custom(
            level: 2,
            colorToken: color,
            dim: 0.4
        )

        // THEN
        #expect(lhs == rhs)
    }

    @Test("Custom inequality when color differs")
    func customInequalityWhenColorDiffers() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeType.custom(
            level: 2,
            colorToken: ColorTokenGeneratedMock.blue(),
            dim: 0.5
        )
        let rhs = SegmentedGaugeType.custom(
            level: 2,
            colorToken: ColorTokenGeneratedMock.orange(),
            dim: 0.5
        )

        // THEN
        #expect(lhs != rhs)
    }

    @Test("Custom inequality when level differs")
    func customInequalityWhenLevelDiffers() {
        // GIVEN / WHEN
        let color = ColorTokenGeneratedMock.blue()

        let lhs = SegmentedGaugeType.custom(
            level: 1,
            colorToken: color,
            dim: 0.5
        )
        let rhs = SegmentedGaugeType.custom(
            level: 3,
            colorToken: color,
            dim: 0.5
        )

        // THEN
        #expect(lhs != rhs)
    }

    @Test("Custom inequality when dim differs")
    func customInequalityWhenDimDiffers() {
        // GIVEN / WHEN
        let color = ColorTokenGeneratedMock.blue()

        let lhs = SegmentedGaugeType.custom(
            level: 1,
            colorToken: color,
            dim: 0.4
        )
        let rhs = SegmentedGaugeType.custom(
            level: 1,
            colorToken: color,
            dim: 0.6
        )

        // THEN
        #expect(lhs != rhs)
    }
}
