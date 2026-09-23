//
//  TextFieldClearModeTests.swift
//  SparkComponentTextInputTests
//
//  Created on 05/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput

final class TextFieldClearModeTests: XCTestCase {

    // MARK: - Default Value Tests

    func testDefaultValue() {
        // GIVEN / WHEN
        let defaultValue = TextFieldClearMode.default

        // THEN
        XCTAssertEqual(defaultValue, .never)
    }

    // MARK: - Show Clear Button Tests

    func testShowClearButton_never() {
        // GIVEN / WHEN
        let mode = TextFieldClearMode.never

        // THEN
        XCTAssertFalse(mode.showClearButton(isFocused: true))
        XCTAssertFalse(mode.showClearButton(isFocused: false))
    }

    func testShowClearButton_always() {
        // GIVEN / WHEN
        let mode = TextFieldClearMode.always

        // THEN
        XCTAssertTrue(mode.showClearButton(isFocused: true))
        XCTAssertTrue(mode.showClearButton(isFocused: false))
    }

    func testShowClearButton_whileEditing() {
        // GIVEN / WHEN
        let mode = TextFieldClearMode.whileEditing

        // THEN
        XCTAssertTrue(mode.showClearButton(isFocused: true))
        XCTAssertFalse(mode.showClearButton(isFocused: false))
    }

    func testShowClearButton_unlessEditing() {
        // GIVEN / WHEN
        let mode = TextFieldClearMode.unlessEditing

        // THEN
        XCTAssertFalse(mode.showClearButton(isFocused: true))
        XCTAssertTrue(mode.showClearButton(isFocused: false))
    }
}
