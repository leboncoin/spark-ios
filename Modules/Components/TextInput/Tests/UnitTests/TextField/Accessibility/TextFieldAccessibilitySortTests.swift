//
//  TextFieldAccessibilitySortTests.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 26/06/2025.
//

//
//  TextFieldAccessibilitySortTests.swift
//  SparkComponentTextInputTests
//
//  Created on 26/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextInput

@Suite("Text Field Accessibility Sort Tests")
struct TextFieldAccessibilitySortTests {

    // MARK: - Tests

    @Test("Enum raw values")
    func enumRawValues() {
        // GIVEN / WHEN / THEN
        #expect(
            TextFieldAccessibilitySort.textField.rawValue == 6,
            "Wrong textField value"
        )

        #expect(
            TextFieldAccessibilitySort.leftAddon.rawValue == 5,
            "Wrong leftAddon value"
        )

        #expect(
            TextFieldAccessibilitySort.leftView.rawValue == 4,
            "Wrong leftView value"
        )

        #expect(
            TextFieldAccessibilitySort.clearButton.rawValue == 3,
            "Wrong clearButton value"
        )

        #expect(
            TextFieldAccessibilitySort.rightView.rawValue == 2,
            "Wrong rightView value"
        )

        #expect(
            TextFieldAccessibilitySort.rightAddon.rawValue == 1,
            "Wrong rightAddon value"
        )

    }
}
