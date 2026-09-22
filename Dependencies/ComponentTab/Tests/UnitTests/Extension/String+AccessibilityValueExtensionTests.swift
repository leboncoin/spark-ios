//
//  String+AccessibilityValueExtensionTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 09/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTab

@Suite("String Accessibility Value Extension Tests")
struct StringAccessibilityValueExtensionTests {

    // MARK: - Tests

    @Test("Accessibility label with first item")
    func accessibilityLabelWithFirstItem() {
        // GIVEN
        let index = 0
        let count = 3

        // WHEN
        let result = String.accessibilityLabel(index: index, count: count)

        // THEN
        // The format should be "1 of 3" or "1 sur 3" depending on locale
        #expect(result.contains("1"), "Result should contain '1' for first item")
        #expect(result.contains("3"), "Result should contain '3' for total count")
    }

    @Test("Accessibility label with middle item")
    func accessibilityLabelWithMiddleItem() {
        // GIVEN
        let index = 1
        let count = 5

        // WHEN
        let result = String.accessibilityLabel(index: index, count: count)

        // THEN
        // The format should be "2 of 5" or "2 sur 5" depending on locale
        #expect(result.contains("2"), "Result should contain '2' for second item")
        #expect(result.contains("5"), "Result should contain '5' for total count")
    }

    @Test("Accessibility label with last item")
    func accessibilityLabelWithLastItem() {
        // GIVEN
        let index = 3
        let count = 4

        // WHEN
        let result = String.accessibilityLabel(index: index, count: count)

        // THEN
        // The format should be "4 of 4" or "4 sur 4" depending on locale
        #expect(result.contains("4"), "Result should contain '4' for both position and count")
    }

    @Test("Accessibility label with single item")
    func accessibilityLabelWithSingleItem() {
        // GIVEN
        let index = 0
        let count = 1

        // WHEN
        let result = String.accessibilityLabel(index: index, count: count)

        // THEN
        // The format should be "1 of 1" or "1 sur 1" depending on locale
        #expect(result.contains("1"), "Result should contain '1' for single item")
    }

    @Test("Accessibility label with large numbers")
    func accessibilityLabelWithLargeNumbers() {
        // GIVEN
        let index = 99
        let count = 100

        // WHEN
        let result = String.accessibilityLabel(index: index, count: count)

        // THEN
        // The format should be "100 of 100" or "100 sur 100" depending on locale
        #expect(result.contains("100"), "Result should contain '100' for large numbers")
    }

    @Test("Accessibility label increments index by one")
    func accessibilityLabelIncrementsIndexByOne() {
        // GIVEN
        let index = 5
        let count = 10

        // WHEN
        let result = String.accessibilityLabel(index: index, count: count)

        // THEN
        // Index should be incremented by 1, so "6 of 10" or "6 sur 10"
        #expect(result.contains("6"), "Result should contain '6' (index + 1)")
        #expect(result.contains("10"), "Result should contain '10' for total count")
        #expect(!result.contains("5"), "Result should not contain '5' (original index)")
    }

    @Test("Accessibility label with zero index")
    func accessibilityLabelWithZeroIndex() {
        // GIVEN
        let index = 0
        let count = 2

        // WHEN
        let result = String.accessibilityLabel(index: index, count: count)

        // THEN
        // Zero index should become 1 in the result
        #expect(result.contains("1"), "Zero index should be displayed as 1")
        #expect(result.contains("2"), "Result should contain '2' for total count")
    }

    @Test("Accessibility label returns non-empty string")
    func accessibilityLabelReturnsNonEmptyString() {
        // GIVEN
        let index = 0
        let count = 3

        // WHEN
        let result = String.accessibilityLabel(index: index, count: count)

        // THEN
        #expect(!result.isEmpty, "Result should not be empty")
    }

    @Test("Accessibility label format consistency")
    func accessibilityLabelFormatConsistency() {
        // GIVEN / WHEN
        let result1 = String.accessibilityLabel(index: 0, count: 5)
        let result2 = String.accessibilityLabel(index: 1, count: 5)
        let result3 = String.accessibilityLabel(index: 2, count: 5)

        // THEN
        // All results should follow the same format pattern
        #expect(!result1.isEmpty)
        #expect(!result2.isEmpty)
        #expect(!result3.isEmpty)

        // Each result should be different
        #expect(result1 != result2)
        #expect(result2 != result3)
        #expect(result1 != result3)
    }
}
