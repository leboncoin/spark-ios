//
//  TextFieldClearModeTests.swift
//  SparkComponentTextInputTests
//
//  Created on 05/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextInput

@Suite("Text Field Clear Mode Tests")
struct TextFieldClearModeTests {

    // MARK: - Default Value Tests

    @Test("Default value")
    func defaultValue() {
        // GIVEN / WHEN
        let defaultValue = TextFieldClearMode.default

        // THEN
        #expect(defaultValue == .never)
    }

    // MARK: - Show Clear Button Tests

    @Test("Show clear button never")
    func showClearButtonNever() {
        // GIVEN / WHEN
        let mode = TextFieldClearMode.never

        // THEN
        #expect(!mode.showClearButton(isFocused: true))
        #expect(!mode.showClearButton(isFocused: false))
    }

    @Test("Show clear button always")
    func showClearButtonAlways() {
        // GIVEN / WHEN
        let mode = TextFieldClearMode.always

        // THEN
        #expect(mode.showClearButton(isFocused: true))
        #expect(mode.showClearButton(isFocused: false))
    }

    @Test("Show clear button while editing")
    func showClearButtonWhileEditing() {
        // GIVEN / WHEN
        let mode = TextFieldClearMode.whileEditing

        // THEN
        #expect(mode.showClearButton(isFocused: true))
        #expect(!mode.showClearButton(isFocused: false))
    }

    @Test("Show clear button unless editing")
    func showClearButtonUnlessEditing() {
        // GIVEN / WHEN
        let mode = TextFieldClearMode.unlessEditing

        // THEN
        #expect(!mode.showClearButton(isFocused: true))
        #expect(mode.showClearButton(isFocused: false))
    }
}
