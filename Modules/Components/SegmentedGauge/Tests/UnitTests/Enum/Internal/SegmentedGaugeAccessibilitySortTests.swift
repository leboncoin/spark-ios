//
//  SegmentedGaugeAccessibilitySortTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 21/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge

final class SegmentedGaugeAccessibilitySortTests: XCTestCase {

    // MARK: - Tests

    func test_title_rawValue() {
        XCTAssertEqual(
            SegmentedGaugeAccessibilitySort.title.rawValue,
            3.0
        )
    }

    func test_description_rawValue() {
        XCTAssertEqual(
            SegmentedGaugeAccessibilitySort.description.rawValue,
            2.0
        )
    }

    func test_segments_rawValue() {
        XCTAssertEqual(
            SegmentedGaugeAccessibilitySort.segments.rawValue,
            1.0
        )
    }
}
