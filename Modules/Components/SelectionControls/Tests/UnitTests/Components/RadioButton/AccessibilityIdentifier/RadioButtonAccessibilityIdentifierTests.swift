//
//  RadioButtonAccessibilityIdentifierTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Radio Button Accessibility Identifier Tests")
struct RadioButtonAccessibilityIdentifierTests {

    // MARK: - Method Tests

    @Test("Radio button item with int id should return expected value")
    func radioButtonItemWithIntIdShouldReturnExpectedValue() {
        // GIVEN
        let givenId = 123

        // WHEN
        let result = RadioButtonAccessibilityIdentifier.radioButtonItem(id: givenId)

        // THEN
        #expect(result == "spark-radio-button-123")
    }

    @Test("Radio button item with string id should return expected value")
    func radioButtonItemWithStringIdShouldReturnExpectedValue() {
        // GIVEN
        let givenId = "test-item"

        // WHEN
        let result = RadioButtonAccessibilityIdentifier.radioButtonItem(id: givenId)

        // THEN
        #expect(result == "spark-radio-button-test-item")
    }

    @Test("Radio button item with complex id should return expected value")
    func radioButtonItemWithComplexIdShouldReturnExpectedValue() {
        // GIVEN
        let givenId = "complex.id-with_symbols"

        // WHEN
        let result = RadioButtonAccessibilityIdentifier.radioButtonItem(id: givenId)

        // THEN
        #expect(result == "spark-radio-button-complex.id-with_symbols")
    }
}
