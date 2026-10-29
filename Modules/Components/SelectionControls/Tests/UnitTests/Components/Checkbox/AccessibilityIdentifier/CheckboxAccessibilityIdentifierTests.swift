//
//  CheckboxAccessibilityIdentifierTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Checkbox Accessibility Identifier Tests")
struct CheckboxAccessibilityIdentifierTests {

    // MARK: - Method Tests

    @Test("Checkbox item with int id should return expected value")
    func checkboxItemWithIntIdShouldReturnExpectedValue() {
        // GIVEN
        let givenId = 123

        // WHEN
        let result = CheckboxAccessibilityIdentifier.checkboxItem(id: givenId)

        // THEN
        #expect(result == "spark-checkbox-123")
    }

    @Test("Checkbox item with string id should return expected value")
    func checkboxItemWithStringIdShouldReturnExpectedValue() {
        // GIVEN
        let givenId = "test-item"

        // WHEN
        let result = CheckboxAccessibilityIdentifier.checkboxItem(id: givenId)

        // THEN
        #expect(result == "spark-checkbox-test-item")
    }

    @Test("Checkbox item with complex id should return expected value")
    func checkboxItemWithComplexIdShouldReturnExpectedValue() {
        // GIVEN
        let givenId = "complex.id-with_symbols"

        // WHEN
        let result = CheckboxAccessibilityIdentifier.checkboxItem(id: givenId)

        // THEN
        #expect(result == "spark-checkbox-complex.id-with_symbols")
    }
}
