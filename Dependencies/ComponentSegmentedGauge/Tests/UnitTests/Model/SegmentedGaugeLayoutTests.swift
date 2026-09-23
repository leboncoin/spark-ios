//
//  SegmentedGaugeLayoutTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge

final class SegmentedGaugeLayoutTests: XCTestCase {

    // MARK: - Default Values Tests

    func test_defaultInitializer_setsZeroValues() {
        // GIVEN / WHEN
        let layout = SegmentedGaugeLayout()

        // THEN
        XCTAssertEqual(layout.contentSpacing, 0)
        XCTAssertEqual(layout.subContentSpacing, 0)
        XCTAssertEqual(layout.segmentsSpacing, 0)
    }

    // MARK: - Equatable Tests

    func test_equality_whenValuesMatch() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeLayout(contentSpacing: 2, subContentSpacing: 3, segmentsSpacing: 4)
        let rhs = SegmentedGaugeLayout(contentSpacing: 2, subContentSpacing: 3, segmentsSpacing: 4)

        // THEN
        XCTAssertEqual(lhs, rhs)
    }

    func test_inequality_whenValuesDiffer() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeLayout(contentSpacing: 2, subContentSpacing: 3, segmentsSpacing: 4)
        let rhs = SegmentedGaugeLayout(contentSpacing: 5, subContentSpacing: 6, segmentsSpacing: 7)

        // THEN
        XCTAssertNotEqual(lhs, rhs)
    }
}
