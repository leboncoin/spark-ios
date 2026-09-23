//
//  SegmentedGaugeSegmentBorderTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge

final class SegmentedGaugeSegmentBorderTests: XCTestCase {

    // MARK: - Default Values Tests

    func test_defaultInitializer_setsZeroValues() {
        // GIVEN / WHEN
        let border = SegmentedGaugeSegmentBorder()

        // THEN
        XCTAssertEqual(border.width, 0)
        XCTAssertEqual(border.radius, 0)
    }

    // MARK: - Equatable Tests

    func test_equality_whenValuesMatch() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeSegmentBorder(width: 2, radius: 5)
        let rhs = SegmentedGaugeSegmentBorder(width: 2, radius: 5)

        XCTAssertEqual(lhs, rhs)
    }

    func test_inequality_whenWidthDiffers() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeSegmentBorder(width: 2, radius: 5)
        let rhs = SegmentedGaugeSegmentBorder(width: 3, radius: 5)

        XCTAssertNotEqual(lhs, rhs)
    }

    func test_inequality_whenRadiusDiffers() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeSegmentBorder(width: 2, radius: 5)
        let rhs = SegmentedGaugeSegmentBorder(width: 2, radius: 4)

        XCTAssertNotEqual(lhs, rhs)
    }
}
