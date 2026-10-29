//
//  SegmentedGaugeColorsTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robot.lemaire on 20/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

@Suite("SegmentedGauge Colors Tests")
struct SegmentedGaugeColorsTests {

    // MARK: - Default Values Tests

    @Test("Default initializer sets default color tokens")
    func defaultInitializerSetsDefaultColorTokens() {
        // GIVEN / WHEN
        let colors = SegmentedGaugeColors()

        // THEN
        #expect(colors.plainSegmentBackground is ColorTokenClear)
        #expect(colors.otherSegmentBackground is ColorTokenClear)
        #expect(colors.plainSegmentBorder is ColorTokenClear)
        #expect(colors.otherSegmentBorder is ColorTokenClear)
        #expect(colors.markerOuterBackground is ColorTokenClear)
        #expect(colors.markerInnerBackground is ColorTokenClear)
        #expect(colors.plainSegmentOpacity == 0.0)
    }

    // MARK: - Segment Background Tests

    @Test("Segment background when is plain true returns plain segment background")
    func segmentBackgroundWhenIsPlainTrueReturnsPlainSegmentBackground() {
        // GIVEN
        let colors = SegmentedGaugeColors()

        // WHEN
        let background = colors.segmentBackground(isPlain: true)

        // THEN
        #expect(background.equals(colors.plainSegmentBackground))
    }

    @Test("Segment background when is plain false returns other segment background")
    func segmentBackgroundWhenIsPlainFalseReturnsOtherSegmentBackground() {
        // GIVEN
        let colors = SegmentedGaugeColors()

        // WHEN
        let background = colors.segmentBackground(isPlain: false)

        // THEN
        #expect(background.equals(colors.otherSegmentBackground))
    }

    // MARK: - Segment Border Tests

    @Test("Segment border when is plain true returns plain segment border")
    func segmentBorderWhenIsPlainTrueReturnsPlainSegmentBorder() {
        // GIVEN
        let colors = SegmentedGaugeColors()

        // WHEN
        let border = colors.segmentBorder(isPlain: true)

        // THEN
        #expect(border.equals(colors.plainSegmentBorder))
    }

    @Test("Segment border when is plain false returns other segment border")
    func segmentBorderWhenIsPlainFalseReturnsOtherSegmentBorder() {
        // GIVEN
        let colors = SegmentedGaugeColors()

        // WHEN
        let border = colors.segmentBorder(isPlain: false)

        // THEN
        #expect(border.equals(colors.otherSegmentBorder))
    }

    // MARK: - Segment Opacity Tests

    @Test("Segment opacity when is plain true returns plain segment opacity")
    func segmentOpacityWhenIsPlainTrueReturnsPlainSegmentOpacity() {
        // GIVEN
        var colors = SegmentedGaugeColors()
        colors.plainSegmentOpacity = 0.5

        // WHEN
        let opacity = colors.segmentOpacity(isPlain: true)

        // THEN
        #expect(opacity == 0.5)
    }

    @Test("Segment opacity when is plain false returns one")
    func segmentOpacityWhenIsPlainFalseReturnsOne() {
        // GIVEN
        let colors = SegmentedGaugeColors()

        // WHEN
        let opacity = colors.segmentOpacity(isPlain: false)

        // THEN
        #expect(opacity == 1.0)
    }

    // MARK: - Segment Is Opacity Tests

    @Test("Segment is opacity when plain opacity less than one returns true")
    func segmentIsOpacityWhenPlainOpacityLessThanOneReturnsTrue() {
        // GIVEN
        var colors = SegmentedGaugeColors()
        colors.plainSegmentOpacity = 0.5

        // WHEN
        let isOpacity = colors.segmentIsOpacity(isPlain: true)

        // THEN
        #expect(isOpacity)
    }

    @Test("Segment is opacity when plain opacity equals one returns false")
    func segmentIsOpacityWhenPlainOpacityEqualsOneReturnsFalse() {
        // GIVEN
        var colors = SegmentedGaugeColors()
        colors.plainSegmentOpacity = 1.0

        // WHEN
        let isOpacity = colors.segmentIsOpacity(isPlain: true)

        // THEN
        #expect(!isOpacity)
    }

    @Test("Segment is opacity when is plain false returns false")
    func segmentIsOpacityWhenIsPlainFalseReturnsFalse() {
        // GIVEN
        let colors = SegmentedGaugeColors()

        // WHEN
        let isOpacity = colors.segmentIsOpacity(isPlain: false)

        // THEN
        #expect(!isOpacity)
    }

    // MARK: - Equatable Tests

    @Test("Equality when all properties match")
    func equalityWhenAllPropertiesMatch() {
        // GIVEN
        let lhs = SegmentedGaugeColors()
        let rhs = SegmentedGaugeColors()

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Inequality when plain segment background differs")
    func inequalityWhenPlainSegmentBackgroundDiffers() {
        // GIVEN
        var lhs = SegmentedGaugeColors()
        var rhs = SegmentedGaugeColors()
        lhs.plainSegmentBackground = ColorTokenGeneratedMock.red()
        rhs.plainSegmentBackground = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        #expect(lhs != rhs)
    }

    @Test("Inequality when other segment background differs")
    func inequalityWhenOtherSegmentBackgroundDiffers() {
        // GIVEN
        var lhs = SegmentedGaugeColors()
        var rhs = SegmentedGaugeColors()
        lhs.otherSegmentBackground = ColorTokenGeneratedMock.red()
        rhs.otherSegmentBackground = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        #expect(lhs != rhs)
    }

    @Test("Inequality when plain segment border differs")
    func inequalityWhenPlainSegmentBorderDiffers() {
        // GIVEN
        var lhs = SegmentedGaugeColors()
        var rhs = SegmentedGaugeColors()
        lhs.plainSegmentBorder = ColorTokenGeneratedMock.red()
        rhs.plainSegmentBorder = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        #expect(lhs != rhs)
    }

    @Test("Inequality when other segment border differs")
    func inequalityWhenOtherSegmentBorderDiffers() {
        // GIVEN
        var lhs = SegmentedGaugeColors()
        var rhs = SegmentedGaugeColors()
        lhs.otherSegmentBorder = ColorTokenGeneratedMock.red()
        rhs.otherSegmentBorder = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        #expect(lhs != rhs)
    }

    @Test("Inequality when marker outer background differs")
    func inequalityWhenMarkerOuterBackgroundDiffers() {
        // GIVEN
        var lhs = SegmentedGaugeColors()
        var rhs = SegmentedGaugeColors()
        lhs.markerOuterBackground = ColorTokenGeneratedMock.red()
        rhs.markerOuterBackground = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        #expect(lhs != rhs)
    }

    @Test("Inequality when marker inner background differs")
    func inequalityWhenMarkerInnerBackgroundDiffers() {
        // GIVEN
        var lhs = SegmentedGaugeColors()
        var rhs = SegmentedGaugeColors()
        lhs.markerInnerBackground = ColorTokenGeneratedMock.red()
        rhs.markerInnerBackground = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
