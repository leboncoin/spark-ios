//
//  SegmentedGaugeSegmentTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge

final class SegmentedGaugeSegmentTests: XCTestCase {

    // MARK: - Tests

    func test_default_isFive() {
        XCTAssertEqual(
            SegmentedGaugeSegments.default,
            .five
        )
    }

    func test_max() {
        XCTAssertEqual(
            SegmentedGaugeSegments.max,
            5
        )
    }
}
