//
//  SpinnerAccessibilityIdentifierTests.swift
//  SparkComponentSpinnerTests
//
//  Created by Claude on 10.12.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
import Testing

@Suite("Spinner AccessibilityIdentifier Tests")
struct SpinnerAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("View has expected value")
    func viewHasExpectedValue() {
        // GIVEN / WHEN / THEN
        #expect(SpinnerAccessibilityIdentifier.view == "spark-spinner")
    }

    @Test("Spinner has expected value")
    func spinnerHasExpectedValue() {
        // GIVEN / WHEN / THEN
        #expect(SpinnerAccessibilityIdentifier.spinner == "spark-spinner")
    }
}
