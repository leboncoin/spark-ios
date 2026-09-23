//
//  LimitedScaledMetricConstantsTests.swift
//  SparkCommonTests
//
//  Created on 22/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkCommon

final class LimitedScaledMetricConstantsTests: XCTestCase {

    // MARK: - Tests

    func test_minValueFactor() {
        // GIVEN / WHEN
        let minValueFactor = LimitedScaledMetricConstants.minValueFactor

        // THEN
        XCTAssertEqual(minValueFactor, 1.0)
    }

    func test_maxValueFactor() {
        // GIVEN / WHEN
        let maxValueFactor = LimitedScaledMetricConstants.maxValueFactor

        // THEN
        XCTAssertEqual(maxValueFactor, 1.5)
    }
}
