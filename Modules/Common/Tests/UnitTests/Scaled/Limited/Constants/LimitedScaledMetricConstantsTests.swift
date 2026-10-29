//
//  LimitedScaledMetricConstantsTests.swift
//  SparkCommonTests
//
//  Created on 22/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkCommon

@Suite("Limited Scaled Metric Constants Tests")
struct LimitedScaledMetricConstantsTests {

    // MARK: - Tests

    @Test("Min value factor")
    func minValueFactor() {
        // GIVEN / WHEN
        let minValueFactor = LimitedScaledMetricConstants.minValueFactor

        // THEN
        #expect(minValueFactor == 1.0)
    }

    @Test("Max value factor")
    func maxValueFactor() {
        // GIVEN / WHEN
        let maxValueFactor = LimitedScaledMetricConstants.maxValueFactor

        // THEN
        #expect(maxValueFactor == 1.5)
    }
}
