//
//  CheckboxAccessibilityIdentifierTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class CheckboxAccessibilityIdentifierTests: XCTestCase {

    // MARK: - Method Tests

    func test_checkboxItem_withIntId_shouldReturnExpectedValue() {
        // GIVEN
        let givenId = 123

        // WHEN
        let result = CheckboxAccessibilityIdentifier.checkboxItem(id: givenId)

        // THEN
        XCTAssertEqual(result, "spark-checkbox-123")
    }

    func test_checkboxItem_withStringId_shouldReturnExpectedValue() {
        // GIVEN
        let givenId = "test-item"

        // WHEN
        let result = CheckboxAccessibilityIdentifier.checkboxItem(id: givenId)

        // THEN
        XCTAssertEqual(result, "spark-checkbox-test-item")
    }

    func test_checkboxItem_withComplexId_shouldReturnExpectedValue() {
        // GIVEN
        let givenId = "complex.id-with_symbols"

        // WHEN
        let result = CheckboxAccessibilityIdentifier.checkboxItem(id: givenId)

        // THEN
        XCTAssertEqual(result, "spark-checkbox-complex.id-with_symbols")
    }
}
