//
//  String+AccessibilityValueExtensionTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("String Accessibility Value Extension Tests")
struct StringAccessibilityValueExtensionTests {

    // MARK: - Tests

    @Test("Accessibility value when is selected true")
    func accessibilityValueWhenIsSelectedTrue() {
        // GIVEN / WHEN
        let result = String.accessibilityValue(isSelected: true)

        // THEN
        #expect(result != "accessibility_value_selected")
        #expect(result != "accessibility_value_not_selected")
    }

    @Test("Accessibility value when is selected false")
    func accessibilityValueWhenIsSelectedFalse() {
        // GIVEN / WHEN
        let result = String.accessibilityValue(isSelected: false)

        // THEN
        #expect(result != "accessibility_value_selected")
        #expect(result != "accessibility_value_not_selected")
    }

    @Test("Accessibility value must be different")
    func accessibilityValueMustBeDifferent() {
        // GIVEN / WHEN
        let result1 = String.accessibilityValue(isSelected: true)
        let result2 = String.accessibilityValue(isSelected: false)

        // THEN
        #expect(result1 != result2)
    }
}
