//
//  RadioButtonAccessibilityIdentifierTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class RadioButtonAccessibilityIdentifierTests: XCTestCase {

    // MARK: - Method Tests

    func test_radioButtonItem_withIntId_shouldReturnExpectedValue() {
        // GIVEN
        let givenId = 123

        // WHEN
        let result = RadioButtonAccessibilityIdentifier.radioButtonItem(id: givenId)

        // THEN
        XCTAssertEqual(result, "spark-radio-button-123")
    }

    func test_radioButtonItem_withStringId_shouldReturnExpectedValue() {
        // GIVEN
        let givenId = "test-item"

        // WHEN
        let result = RadioButtonAccessibilityIdentifier.radioButtonItem(id: givenId)

        // THEN
        XCTAssertEqual(result, "spark-radio-button-test-item")
    }

    func test_radioButtonItem_withComplexId_shouldReturnExpectedValue() {
        // GIVEN
        let givenId = "complex.id-with_symbols"

        // WHEN
        let result = RadioButtonAccessibilityIdentifier.radioButtonItem(id: givenId)

        // THEN
        XCTAssertEqual(result, "spark-radio-button-complex.id-with_symbols")
    }
}
