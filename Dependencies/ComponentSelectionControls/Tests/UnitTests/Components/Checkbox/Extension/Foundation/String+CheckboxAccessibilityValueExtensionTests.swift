//
//  String+CheckboxAccessibilityValueExtensionTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class StringCheckboxAccessibilityValueExtensionTests: XCTestCase {

    // MARK: - Tests

    func test_accessibilityValue_whenSelectionStateSelected_shouldReturnSelectedString() {
        // GIVEN / WHEN
        let result = String.accessibilityValue(selectionState: .selected)

        // THEN
        XCTAssertNotEqual(result, "accessibility_value_selected")
        XCTAssertNotEqual(result, "accessibility_value_not_selected")
        XCTAssertNotEqual(result, "accessibility_value_indeterminate")
    }

    func test_accessibilityValue_whenSelectionStateUnselected_shouldReturnNotSelectedString() {
        // GIVEN / WHEN
        let result = String.accessibilityValue(selectionState: .unselected)

        // THEN
        XCTAssertNotEqual(result, "accessibility_value_selected")
        XCTAssertNotEqual(result, "accessibility_value_not_selected")
        XCTAssertNotEqual(result, "accessibility_value_indeterminate")
    }

    func test_accessibilityValue_whenSelectionStateIndeterminate_shouldReturnIndeterminateString() {
        // GIVEN / WHEN
        let result = String.accessibilityValue(selectionState: .indeterminate)

        // THEN
        XCTAssertNotEqual(result, "accessibility_value_selected")
        XCTAssertNotEqual(result, "accessibility_value_not_selected")
        XCTAssertNotEqual(result, "accessibility_value_indeterminate")
    }

    func test_accessibilityValue_mustBeDifferent() {
        // GIVEN / WHEN
        let result1 = String.accessibilityValue(selectionState: .selected)
        let result2 = String.accessibilityValue(selectionState: .unselected)
        let result3 = String.accessibilityValue(selectionState: .indeterminate)

        // THEN
        XCTAssertNotEqual(result1, result2)
        XCTAssertNotEqual(result1, result3)
        XCTAssertNotEqual(result2, result3)
    }
}
