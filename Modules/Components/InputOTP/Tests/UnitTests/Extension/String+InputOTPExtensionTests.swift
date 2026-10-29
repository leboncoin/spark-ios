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

    @Test
    func slotValueWithValidIndexShouldReturnCharacter() {
        #expect("123".slotValue(at: 1) == "2")
    }

    @Test
    func slotValueWithOutOfBoundsIndexShouldReturnNil() {
        #expect("123".slotValue(at: 3) == nil)
    }

    // MARK: - Slot Content Tests

    @Test
    func slotContentWithValueShouldReturnValue() {
        #expect(Optional("4").slotContent(isFocus: true) == "4")
    }

    @Test(arguments: [nil, ""] as [String?])
    func slotContentWhenEmptyAndFocusShouldReturnFocusContent(value: String?) {
        #expect(value.slotContent(isFocus: true) == InputOTPConstants.Content.focus)
    }

    @Test(arguments: [nil, ""] as [String?])
    func slotContentWhenEmptyShouldReturnEmptyContent(value: String?) {
        #expect(value.slotContent(isFocus: false) == InputOTPConstants.Content.empty)
    }

    // MARK: - Validated Tests

    @Test
    func validatedWithValidNumberShouldReturnSameValue() {
        let result = "1234".validated(codeType: .number, digits: .six)
        #expect(result == .init(value: "1234", hadInvalidCharacters: false))
    }

    @Test
    func validatedWithInvalidCharactersShouldFilter() {
        let result = "1a2".validated(codeType: .number, digits: .six)
        #expect(result == .init(value: "12", hadInvalidCharacters: true))
    }

    @Test
    func validatedWithLetterShouldUppercase() {
        let result = "ab1".validated(codeType: .letter, digits: .four)
        #expect(result == .init(value: "AB", hadInvalidCharacters: true))
    }

    @Test
    func validatedWithAlphanumericShouldKeepLettersAndNumbers() {
        let result = "a1-b".validated(codeType: .alphanumeric, digits: .four)
        #expect(result == .init(value: "A1B", hadInvalidCharacters: true))
    }

    @Test
    func validatedExceedingMaxLengthShouldReplaceLastCharacter() {
        let result = "12345".validated(codeType: .number, digits: .four)
        #expect(result == .init(value: "1235", hadInvalidCharacters: false))
    }
}
