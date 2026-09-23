//
//  String+AccessibilityValueExtensionTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class StringAccessibilityValueExtensionTests: XCTestCase {

    // MARK: - Tests

    func test_accessibilityValue_whenIsSelectedTrue() {
        // GIVEN / WHEN
        let result = String.accessibilityValue(isSelected: true)

        // THEN
        XCTAssertNotEqual(result, "accessibility_value_selected")
        XCTAssertNotEqual(result, "accessibility_value_not_selected")
    }

    func test_accessibilityValue_whenIsSelectedFalse() {
        // GIVEN / WHEN
        let result = String.accessibilityValue(isSelected: false)

        // THEN
        XCTAssertNotEqual(result, "accessibility_value_selected")
        XCTAssertNotEqual(result, "accessibility_value_not_selected")
    }

    func test_accessibilityValue_mustBeDifferent() {
        // GIVEN / WHEN
        let result1 = String.accessibilityValue(isSelected: true)
        let result2 = String.accessibilityValue(isSelected: false)

        // THEN
        XCTAssertNotEqual(result1, result2)
    }
}
