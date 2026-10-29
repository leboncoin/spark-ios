//
//  String+CheckboxAccessibilityValueExtensionTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("String Checkbox Accessibility Value Extension Tests")
struct StringCheckboxAccessibilityValueExtensionTests {

    // MARK: - Tests

    @Test("Accessibility value when selection state selected should return selected string")
    func accessibilityValueWhenSelectionStateSelectedShouldReturnSelectedString() {
        // GIVEN / WHEN
        let result = String.accessibilityValue(selectionState: .selected)

        // THEN
        #expect(result != "accessibility_value_selected")
        #expect(result != "accessibility_value_not_selected")
        #expect(result != "accessibility_value_indeterminate")
    }

    @Test("Accessibility value when selection state unselected should return not selected string")
    func accessibilityValueWhenSelectionStateUnselectedShouldReturnNotSelectedString() {
        // GIVEN / WHEN
        let result = String.accessibilityValue(selectionState: .unselected)

        // THEN
        #expect(result != "accessibility_value_selected")
        #expect(result != "accessibility_value_not_selected")
        #expect(result != "accessibility_value_indeterminate")
    }

    @Test("Accessibility value when selection state indeterminate should return indeterminate string")
    func accessibilityValueWhenSelectionStateIndeterminateShouldReturnIndeterminateString() {
        // GIVEN / WHEN
        let result = String.accessibilityValue(selectionState: .indeterminate)

        // THEN
        #expect(result != "accessibility_value_selected")
        #expect(result != "accessibility_value_not_selected")
        #expect(result != "accessibility_value_indeterminate")
    }

    @Test("Accessibility value must be different")
    func accessibilityValueMustBeDifferent() {
        // GIVEN / WHEN
        let result1 = String.accessibilityValue(selectionState: .selected)
        let result2 = String.accessibilityValue(selectionState: .unselected)
        let result3 = String.accessibilityValue(selectionState: .indeterminate)

        // THEN
        #expect(result1 != result2)
        #expect(result1 != result3)
        #expect(result2 != result3)
    }
}
