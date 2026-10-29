//
//  CGFloat+AccessibilityValueExtensionTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentProgressBar

@Suite("CG Float Accessibility Value Extension Tests")
struct CGFloatAccessibilityValueExtensionTests {

    // MARK: - Tests

    @Test("Accessibility value returns correct percentage for zero")
    func accessibilityValueReturnsCorrectPercentageForZero() {
        // GIVEN / WHEN / THEN
        self.testAccessibilityValue(
            givenValue: 0.0,
            expectedString: "0%"
        )
    }

    @Test("Accessibility value returns correct percentage for one")
    func accessibilityValueReturnsCorrectPercentageForOne() {
        // GIVEN / WHEN / THEN
        self.testAccessibilityValue(
            givenValue: 1.0,
            expectedString: "100%"
        )
    }

    @Test("Accessibility value returns correct percentage for half")
    func accessibilityValueReturnsCorrectPercentageForHalf() {
        // GIVEN / WHEN / THEN
        self.testAccessibilityValue(
            givenValue: 0.5,
            expectedString: "50%"
        )
    }

    @Test("Accessibility value returns correct percentage for quarter")
    func accessibilityValueReturnsCorrectPercentageForQuarter() {
        // GIVEN / WHEN / THEN
        self.testAccessibilityValue(
            givenValue: 0.25,
            expectedString: "25%"
        )
    }

    @Test("Accessibility value returns correct percentage for three quarters")
    func accessibilityValueReturnsCorrectPercentageForThreeQuarters() {
        // GIVEN / WHEN / THEN
        self.testAccessibilityValue(
            givenValue: 0.75,
            expectedString: "75%"
        )
    }

    @Test("Accessibility value returns correct percentage for small decimal")
    func accessibilityValueReturnsCorrectPercentageForSmallDecimal() {
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
        #expect(accessibilityValue == expectedString, "Wrong accessibility value for \(givenValue)")
    }
}
