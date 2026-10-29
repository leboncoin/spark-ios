//
//  SegmentedGaugeSizesTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentSegmentedGauge

@Suite("SegmentedGauge Sizes Tests")
struct SegmentedGaugeSizesTests {

    // MARK: - Default Values Tests

    @Test("Default initializer sets zero values")
    func defaultInitializerSetsZeroValues() {
        // GIVEN / WHEN
        let sizes = SegmentedGaugeSizes()

        // THEN
        #expect(sizes.segmentSize == .zero)
        #expect(sizes.markerInnerSize == .zero)
        #expect(sizes.markerOuterSize == .zero)
    }

    // MARK: - Initialization Tests

    @Test("Init with values sets correct values")
    func initWithValuesSetsCorrectValues() {
        // GIVEN
        let segmentSize = CGSize(width: 24, height: 8)
        let markerInnerSize: CGFloat = 12.0
        let markerOuterSize: CGFloat = 2.0

        // WHEN
        let sizes = SegmentedGaugeSizes(
            segmentSize: segmentSize,
            markerInnerSize: markerInnerSize,
            markerOuterSize: markerOuterSize
        )

        // THEN
        #expect(sizes.segmentSize == segmentSize)
        #expect(sizes.markerInnerSize == markerInnerSize)
        #expect(sizes.markerOuterSize == markerOuterSize)
    }

    // MARK: - Equatable Tests

    @Test("Equality when values match")
    func equalityWhenValuesMatch() {
        // GIVEN
        let segmentSize = CGSize(width: 34, height: 12)
        let markerInnerSize: CGFloat = 8.0
        let markerOuterSize: CGFloat = 1.5

        let lhs = SegmentedGaugeSizes(
            segmentSize: segmentSize,
            markerInnerSize: markerInnerSize,
            markerOuterSize: markerOuterSize
        )
        let rhs = SegmentedGaugeSizes(
            segmentSize: segmentSize,
            markerInnerSize: markerInnerSize,
            markerOuterSize: markerOuterSize
        )

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Inequality when segment size differs")
    func inequalityWhenSegmentSizeDiffers() {
        // GIVEN
        let lhs = SegmentedGaugeSizes(
            segmentSize: CGSize(width: 24, height: 8),
            markerInnerSize: 10.0,
            markerOuterSize: 2.0
        )
        let rhs = SegmentedGaugeSizes(
            segmentSize: CGSize(width: 34, height: 12),
            markerInnerSize: 10.0,
            markerOuterSize: 2.0
        )

        // WHEN / THEN
        #expect(lhs != rhs)
    }

    @Test("Inequality when marker inner size differs")
    func inequalityWhenMarkerInnerSizeDiffers() {
        // GIVEN
        let segmentSize = CGSize(width: 24, height: 8)
        let lhs = SegmentedGaugeSizes(
            segmentSize: segmentSize,
            markerInnerSize: 8.0,
            markerOuterSize: 2.0
        )
        let rhs = SegmentedGaugeSizes(
            segmentSize: segmentSize,
            markerInnerSize: 12.0,
            markerOuterSize: 2.0
        )

        // WHEN / THEN
        #expect(lhs != rhs)
    }

    @Test("Inequality when marker outer size width differs")
    func inequalityWhenMarkerOuterSizeWidthDiffers() {
        // GIVEN
        let segmentSize = CGSize(width: 24, height: 8)
        let markerInnerSize: CGFloat = 8.0
        let lhs = SegmentedGaugeSizes(
            segmentSize: segmentSize,
            markerInnerSize: markerInnerSize,
            markerOuterSize: 1.0
        )
        let rhs = SegmentedGaugeSizes(
            segmentSize: segmentSize,
            markerInnerSize: markerInnerSize,
            markerOuterSize: 2.0
        )

        // WHEN / THEN
        #expect(lhs != rhs)
    }

    @Test("Inequality when all values differ")
    func inequalityWhenAllValuesDiffer() {
        // GIVEN
        let lhs = SegmentedGaugeSizes(
            segmentSize: CGSize(width: 24, height: 8),
            markerInnerSize: 8.0,
            markerOuterSize: 1.0
        )
        let rhs = SegmentedGaugeSizes(
            segmentSize: CGSize(width: 34, height: 12),
            markerInnerSize: 12.0,
            markerOuterSize: 2.0
        )

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
