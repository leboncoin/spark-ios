//
//  SegmentedGaugeSizesTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 30/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import Foundation
@testable import SparkComponentSegmentedGauge

final class SegmentedGaugeSizesTests: XCTestCase {

    // MARK: - Default Values Tests

    func test_defaultInitializer_setsZeroValues() {
        // GIVEN / WHEN
        let sizes = SegmentedGaugeSizes()

        // THEN
        XCTAssertEqual(sizes.segmentSize, .zero)
        XCTAssertEqual(sizes.markerInnerSize, .zero)
        XCTAssertEqual(sizes.markerOuterSize, .zero)
    }

    // MARK: - Initialization Tests

    func test_initWithValues_setsCorrectValues() {
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
        XCTAssertEqual(sizes.segmentSize, segmentSize)
        XCTAssertEqual(sizes.markerInnerSize, markerInnerSize)
        XCTAssertEqual(sizes.markerOuterSize, markerOuterSize)
    }

    // MARK: - Equatable Tests

    func test_equality_whenValuesMatch() {
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
        XCTAssertEqual(lhs, rhs)
    }

    func test_inequality_whenSegmentSizeDiffers() {
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
        XCTAssertNotEqual(lhs, rhs)
    }

    func test_inequality_whenMarkerInnerSizeDiffers() {
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
        XCTAssertNotEqual(lhs, rhs)
    }

    func test_inequality_whenMarkerOuterSizeWidthDiffers() {
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
        XCTAssertNotEqual(lhs, rhs)
    }

    func test_inequality_whenAllValuesDiffer() {
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
        XCTAssertNotEqual(lhs, rhs)
    }
}
