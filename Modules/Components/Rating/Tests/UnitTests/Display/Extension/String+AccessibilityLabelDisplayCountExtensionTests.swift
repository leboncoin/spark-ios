//
//  String+AccessibilityLabelDisplayCountExtensionTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 11/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentRating

@Suite("String Accessibility Label Display Count Extension Tests")
struct StringAccessibilityLabelDisplayCountExtensionTests {

    // MARK: - Tests

    @Test("Accessibility label display count with valid text")
    func accessibilityLabelDisplayCountWithValidText() {
        // GIVEN
        let text = "100"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        #expect(result != nil)
        #expect(result?.contains("100") ?? false)
        #expect(!(result?.isEmpty ?? true))
    }

    @Test("Accessibility label display count with numeric string")
    func accessibilityLabelDisplayCountWithNumericString() {
        // GIVEN
        let text = "42"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        #expect(result != nil)
        #expect(result?.contains("42") ?? false)
    }

    @Test("Accessibility label display count with formatted number")
    func accessibilityLabelDisplayCountWithFormattedNumber() {
        // GIVEN
        let text = "1,234"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        #expect(result != nil)
        #expect(result?.contains("1,234") ?? false)
    }

    @Test("Accessibility label display count with single digit")
    func accessibilityLabelDisplayCountWithSingleDigit() {
        // GIVEN
        let text = "1"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        #expect(result != nil)
        #expect(result?.contains("1") ?? false)
    }

    @Test("Accessibility label display count with large number")
    func accessibilityLabelDisplayCountWithLargeNumber() {
        // GIVEN
        let text = "999999"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        #expect(result != nil)
        #expect(result?.contains("999999") ?? false)
    }

    @Test("Accessibility label display count with zero")
    func accessibilityLabelDisplayCountWithZero() {
        // GIVEN
        let text = "0"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        #expect(result != nil)
        #expect(result?.contains("0") ?? false)
    }

    @Test("Accessibility label display count with empty string")
    func accessibilityLabelDisplayCountWithEmptyString() {
        // GIVEN
        let text = ""

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        #expect(result != nil)
        #expect(!(result?.isEmpty ?? true))
    }

    @Test("Accessibility label display count with nil text")
    func accessibilityLabelDisplayCountWithNilText() {
        // GIVEN
        let text: String? = nil

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        #expect(result == nil)
    }

    @Test("Accessibility label display count with whitespace")
    func accessibilityLabelDisplayCountWithWhitespace() {
        // GIVEN
        let text = "   "

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        #expect(result != nil)
        #expect(result?.contains("   ") ?? false)
    }

    @Test("Accessibility label display count with text containing special characters")
    func accessibilityLabelDisplayCountWithTextContainingSpecialCharacters() {
        // GIVEN
        let text = "1.5k"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        #expect(result != nil)
        #expect(result?.contains("1.5k") ?? false)
    }

    @Test("Accessibility label display count returns non empty for valid input")
    func accessibilityLabelDisplayCountReturnsNonEmptyForValidInput() {
        // GIVEN
        let text = "50"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        #expect(result != nil)
        #expect(result?.count ?? 0 > text.count)
    }

    @Test("Accessibility label display count with alphanumeric text")
    func accessibilityLabelDisplayCountWithAlphanumericText() {
        // GIVEN
        let text = "2.5k+"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        #expect(result != nil)
        #expect(result?.contains("2.5k+") ?? false)
    }
}
