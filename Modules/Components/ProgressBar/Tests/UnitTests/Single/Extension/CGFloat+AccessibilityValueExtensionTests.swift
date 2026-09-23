//
//  CGFloat+AccessibilityValueExtensionTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentProgressBar

final class CGFloatAccessibilityValueExtensionTests: XCTestCase {

    // MARK: - Tests

    func test_accessibilityValue_returns_correct_percentage_for_zero() {
        // GIVEN / WHEN / THEN
        self.testAccessibilityValue(
            givenValue: 0.0,
            expectedString: "0%"
        )
    }

    func test_accessibilityValue_returns_correct_percentage_for_one() {
        // GIVEN / WHEN / THEN
        self.testAccessibilityValue(
            givenValue: 1.0,
            expectedString: "100%"
        )
    }

    func test_accessibilityValue_returns_correct_percentage_for_half() {
        // GIVEN / WHEN / THEN
        self.testAccessibilityValue(
            givenValue: 0.5,
            expectedString: "50%"
        )
    }

    func test_accessibilityValue_returns_correct_percentage_for_quarter() {
        // GIVEN / WHEN / THEN
        self.testAccessibilityValue(
            givenValue: 0.25,
            expectedString: "25%"
        )
    }

    func test_accessibilityValue_returns_correct_percentage_for_three_quarters() {
        // GIVEN / WHEN / THEN
        self.testAccessibilityValue(
            givenValue: 0.75,
            expectedString: "75%"
        )
    }

    func test_accessibilityValue_returns_correct_percentage_for_small_decimal() {
        // GIVEN / WHEN / THEN
        self.testAccessibilityValue(
            givenValue: 0.123,
            expectedString: "12%"
        )
    }
}

// MARK: - Testing Helpers

private extension CGFloatAccessibilityValueExtensionTests {

    func testAccessibilityValue(
        givenValue: CGFloat,
        expectedString: String
    ) {
        // GIVEN
        let value = givenValue

        // WHEN
        let accessibilityValue = value.accessibilityValue

        // THEN
        XCTAssertEqual(
            accessibilityValue,
            expectedString,
            "Wrong accessibility value for \(givenValue)"
        )
    }
}
