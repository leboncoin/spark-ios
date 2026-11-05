//
//  String+InputOTPExtensionTests.swift
//  SparkComponentInputOTPTests
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentInputOTP

// MARK: - Tests

struct StringInputOTPExtensionTests {

    // MARK: - Slot Value Tests

    @Test("Slot value with valid index should return character")
    func slotValueWithValidIndexShouldReturnCharacter() {
        #expect("123".slotValue(at: 1) == "2")
    }

    @Test("Slot value with out of bounds index should return nil")
    func slotValueWithOutOfBoundsIndexShouldReturnNil() {
        #expect("123".slotValue(at: 3) == nil)
    }

    // MARK: - Slot Content Tests

    @Test("Slot content with value should return value")
    func slotContentWithValueShouldReturnValue() {
        #expect(Optional("4").slotContent(isFocus: true) == "4")
    }

    @Test("Slot content when empty and focus should return focus content", arguments: [nil, ""] as [String?])
    func slotContentWhenEmptyAndFocusShouldReturnFocusContent(value: String?) {
        #expect(value.slotContent(isFocus: true) == InputOTPConstants.Content.focus)
    }

    @Test("Slot content when empty should return empty content", arguments: [nil, ""] as [String?])
    func slotContentWhenEmptyShouldReturnEmptyContent(value: String?) {
        #expect(value.slotContent(isFocus: false) == InputOTPConstants.Content.empty)
    }

    // MARK: - Validated Tests

    @Test("Validated with valid number should return same value")
    func validatedWithValidNumberShouldReturnSameValue() {
        let result = "1234".validated(codeType: .number, digits: .six)
        #expect(result == .init(value: "1234", hadInvalidCharacters: false))
    }

    @Test("Validated with invalid characters should filter")
    func validatedWithInvalidCharactersShouldFilter() {
        let result = "1a2".validated(codeType: .number, digits: .six)
        #expect(result == .init(value: "12", hadInvalidCharacters: true))
    }

    @Test("Validated with letter should uppercase")
    func validatedWithLetterShouldUppercase() {
        let result = "ab1".validated(codeType: .letter, digits: .four)
        #expect(result == .init(value: "AB", hadInvalidCharacters: true))
    }

    @Test("Validated with alphanumeric should keep letters and numbers")
    func validatedWithAlphanumericShouldKeepLettersAndNumbers() {
        let result = "a1-b".validated(codeType: .alphanumeric, digits: .four)
        #expect(result == .init(value: "A1B", hadInvalidCharacters: true))
    }

    @Test("Validated exceeding max length should replace last character")
    func validatedExceedingMaxLengthShouldReplaceLastCharacter() {
        let result = "12345".validated(codeType: .number, digits: .four)
        #expect(result == .init(value: "1235", hadInvalidCharacters: false))
    }
}
