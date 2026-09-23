//
//  SegmentedGaugeColorsTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robot.lemaire on 20/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

final class SegmentedGaugeColorsTests: XCTestCase {

    // MARK: - Default Values Tests

    func test_defaultInitializer_setsDefaultColorTokens() {
        // GIVEN / WHEN
        let colors = SegmentedGaugeColors()

        // THEN
        XCTAssertTrue(colors.plainSegmentBackground is ColorTokenClear)
        XCTAssertTrue(colors.otherSegmentBackground is ColorTokenClear)
        XCTAssertTrue(colors.plainSegmentBorder is ColorTokenClear)
        XCTAssertTrue(colors.otherSegmentBorder is ColorTokenClear)
        XCTAssertTrue(colors.markerOuterBackground is ColorTokenClear)
        XCTAssertTrue(colors.markerInnerBackground is ColorTokenClear)
        XCTAssertEqual(colors.plainSegmentOpacity, 0.0)
    }

    // MARK: - Segment Background Tests

    func test_segmentBackground_whenIsPlainTrue_returnsPlainSegmentBackground() {
        // GIVEN
        let colors = SegmentedGaugeColors()

        // WHEN
        let background = colors.segmentBackground(isPlain: true)

        // THEN
        XCTAssertTrue(background.equals(colors.plainSegmentBackground))
    }

    func test_segmentBackground_whenIsPlainFalse_returnsOtherSegmentBackground() {
        // GIVEN
        let colors = SegmentedGaugeColors()

        // WHEN
        let background = colors.segmentBackground(isPlain: false)

        // THEN
        XCTAssertTrue(background.equals(colors.otherSegmentBackground))
    }

    // MARK: - Segment Border Tests

    func test_segmentBorder_whenIsPlainTrue_returnsPlainSegmentBorder() {
        // GIVEN
        let colors = SegmentedGaugeColors()

        // WHEN
        let border = colors.segmentBorder(isPlain: true)

        // THEN
        XCTAssertTrue(border.equals(colors.plainSegmentBorder))
    }

    func test_segmentBorder_whenIsPlainFalse_returnsOtherSegmentBorder() {
        // GIVEN
        let colors = SegmentedGaugeColors()

        // WHEN
        let border = colors.segmentBorder(isPlain: false)

        // THEN
        XCTAssertTrue(border.equals(colors.otherSegmentBorder))
    }

    // MARK: - Segment Opacity Tests

    func test_segmentOpacity_whenIsPlainTrue_returnsPlainSegmentOpacity() {
        // GIVEN
        var colors = SegmentedGaugeColors()
        colors.plainSegmentOpacity = 0.5

        // WHEN
        let opacity = colors.segmentOpacity(isPlain: true)

        // THEN
        XCTAssertEqual(opacity, 0.5)
    }

    func test_segmentOpacity_whenIsPlainFalse_returnsOne() {
        // GIVEN
        let colors = SegmentedGaugeColors()

        // WHEN
        let opacity = colors.segmentOpacity(isPlain: false)

        // THEN
        XCTAssertEqual(opacity, 1.0)
    }

    // MARK: - Segment Is Opacity Tests

    func test_segmentIsOpacity_whenPlainOpacityLessThanOne_returnsTrue() {
        // GIVEN
        var colors = SegmentedGaugeColors()
        colors.plainSegmentOpacity = 0.5

        // WHEN
        let isOpacity = colors.segmentIsOpacity(isPlain: true)

        // THEN
        XCTAssertTrue(isOpacity)
    }

    func test_segmentIsOpacity_whenPlainOpacityEqualsOne_returnsFalse() {
        // GIVEN
        var colors = SegmentedGaugeColors()
        colors.plainSegmentOpacity = 1.0

        // WHEN
        let isOpacity = colors.segmentIsOpacity(isPlain: true)

        // THEN
        XCTAssertFalse(isOpacity)
    }

    func test_segmentIsOpacity_whenIsPlainFalse_returnsFalse() {
        // GIVEN
        let colors = SegmentedGaugeColors()

        // WHEN
        let isOpacity = colors.segmentIsOpacity(isPlain: false)

        // THEN
        XCTAssertFalse(isOpacity)
    }

    // MARK: - Equatable Tests

    func test_equality_whenAllPropertiesMatch() {
        // GIVEN
        let lhs = SegmentedGaugeColors()
        let rhs = SegmentedGaugeColors()

        // WHEN / THEN
        XCTAssertEqual(lhs, rhs)
    }

    func test_inequality_whenPlainSegmentBackgroundDiffers() {
        // GIVEN
        var lhs = SegmentedGaugeColors()
        var rhs = SegmentedGaugeColors()
        lhs.plainSegmentBackground = ColorTokenGeneratedMock.red()
        rhs.plainSegmentBackground = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        XCTAssertNotEqual(lhs, rhs)
    }

    func test_inequality_whenOtherSegmentBackgroundDiffers() {
        // GIVEN
        var lhs = SegmentedGaugeColors()
        var rhs = SegmentedGaugeColors()
        lhs.otherSegmentBackground = ColorTokenGeneratedMock.red()
        rhs.otherSegmentBackground = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        XCTAssertNotEqual(lhs, rhs)
    }

    func test_inequality_whenPlainSegmentBorderDiffers() {
        // GIVEN
        var lhs = SegmentedGaugeColors()
        var rhs = SegmentedGaugeColors()
        lhs.plainSegmentBorder = ColorTokenGeneratedMock.red()
        rhs.plainSegmentBorder = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        XCTAssertNotEqual(lhs, rhs)
    }

    func test_inequality_whenOtherSegmentBorderDiffers() {
        // GIVEN
        var lhs = SegmentedGaugeColors()
        var rhs = SegmentedGaugeColors()
        lhs.otherSegmentBorder = ColorTokenGeneratedMock.red()
        rhs.otherSegmentBorder = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        XCTAssertNotEqual(lhs, rhs)
    }

    func test_inequality_whenMarkerOuterBackgroundDiffers() {
        // GIVEN
        var lhs = SegmentedGaugeColors()
        var rhs = SegmentedGaugeColors()
        lhs.markerOuterBackground = ColorTokenGeneratedMock.red()
        rhs.markerOuterBackground = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        XCTAssertNotEqual(lhs, rhs)
    }

    func test_inequality_whenMarkerInnerBackgroundDiffers() {
        // GIVEN
        var lhs = SegmentedGaugeColors()
        var rhs = SegmentedGaugeColors()
        lhs.markerInnerBackground = ColorTokenGeneratedMock.red()
        rhs.markerInnerBackground = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        XCTAssertNotEqual(lhs, rhs)
    }
}
