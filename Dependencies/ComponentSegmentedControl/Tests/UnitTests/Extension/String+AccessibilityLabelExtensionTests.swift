//
//  String+AccessibilityLabelExtensionTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 25/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
import Testing

// MARK: - Tests

struct StringAccessibilityLabelExtensionTests {

    // MARK: - Tests

    @Test
    func accessibilityLabel_withFirstIndex_returnsExpectedValue() {
        // GIVEN
        let index = 0
        let count = 3

        // WHEN
        let result = String.accessibilityLabel(index: index, count: count)

        // THEN
        #expect(result.contains("1"), "Result should contain '1' for first item")
        #expect(result.contains("3"), "Result should contain '3' for total count")
    }

    @Test
    func accessibilityLabel_withMiddleIndex_returnsExpectedValue() {
        // GIVEN
        let index = 1
        let count = 5

        // WHEN
        let result = String.accessibilityLabel(index: index, count: count)

        // THEN
        #expect(result.contains("2"), "Result should contain '2' for first item")
        #expect(result.contains("5"), "Result should contain '5' for total count")
    }
}
