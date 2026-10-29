//
//  ScaledPaddingConstantsTests.swift
//  SparkCommonTests
//
//  Created on 22/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkCommon

@Suite("Scaled Padding Constants Tests")
struct ScaledPaddingConstantsTests {

    // MARK: - Tests

    @Test("Min value factor")
    func minValueFactor() {
        // GIVEN / WHEN
        let minValueFactor = ScaledPaddingConstants.minValueFactor

        // THEN
        #expect(minValueFactor == 1.0)
    }

    @Test("Max value factor")
    func maxValueFactor() {
        // GIVEN / WHEN
        let maxValueFactor = ScaledPaddingConstants.maxValueFactor

        // THEN
        #expect(maxValueFactor == 1.5)
    }
}
