//
//  SegmentedGaugeAlignmentTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge

final class SegmentedGaugeAlignmentTests: XCTestCase {

    // MARK: - Tests

    func test_default_isHorizontal() {
        XCTAssertEqual(
            SegmentedGaugeAlignment.default,
            .horizontal
        )
    }
}
