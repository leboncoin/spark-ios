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

import XCTest
@testable import SparkComponentTextInput

final class TextFieldAccessibilitySortTests: XCTestCase {

    // MARK: - Tests

    func testEnumRawValues() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(
            TextFieldAccessibilitySort.textField.rawValue,
            6,
            "Wrong textField value"
        )

        XCTAssertEqual(
            TextFieldAccessibilitySort.leftAddon.rawValue,
            5,
            "Wrong leftAddon value"
        )

        XCTAssertEqual(
            TextFieldAccessibilitySort.leftView.rawValue,
            4,
            "Wrong leftView value"
        )

        XCTAssertEqual(
            TextFieldAccessibilitySort.clearButton.rawValue,
            3,
            "Wrong clearButton value"
        )

        XCTAssertEqual(
            TextFieldAccessibilitySort.rightView.rawValue,
            2,
            "Wrong rightView value"
        )

        XCTAssertEqual(
            TextFieldAccessibilitySort.rightAddon.rawValue,
            1,
            "Wrong rightAddon value"
        )

    }
}
