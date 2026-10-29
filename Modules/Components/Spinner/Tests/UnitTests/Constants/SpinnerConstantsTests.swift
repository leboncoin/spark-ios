//
//  SpinnerConstantsTests.swift
//  SparkComponentSpinnerTests
//
//  Created by Claude on 10.12.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
import Testing

@Suite("Spinner Constants Tests")
struct SpinnerConstantsTests {

    // MARK: - Tests

    @Test("Stroke has expected value")
    func strokeHasExpectedValue() {
        // GIVEN / WHEN / THEN
        #expect(SpinnerConstants.strokeWidth == 2.0)
    }

    @Test("Animation duration has expected value")
    func animationDurationHasExpectedValue() {
        // GIVEN / WHEN / THEN
        #expect(SpinnerConstants.animationDuration == 1.0)
    }
}
