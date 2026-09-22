//
//  SegmentedGaugeSizeTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSegmentedGauge

final class SegmentedGaugeSizeTests: XCTestCase {

    // MARK: - Tests

    func test_default_isMedium() {
        XCTAssertEqual(
            SegmentedGaugeSize.default,
            .medium
        )
    }
}
