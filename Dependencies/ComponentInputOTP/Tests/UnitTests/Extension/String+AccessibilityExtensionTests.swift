//
//  String+AccessibilityExtensionTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 10/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
import Testing

@Suite("String Accessibility Extension Tests")
struct StringAccessibilityExtensionTests {

    // MARK: - Tests

    // MARK: Accessibility Actions

    @Test("Clear all action returns non-empty string")
    func clearAllActionReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityClearAllAction

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Paste action returns non-empty string")
    func pasteActionReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityPasteAction

        // THEN
        #expect(!result.isEmpty)
    }

    // MARK: Accessibility Label

    @Test("Label for number code type with 4 digits returns non-empty string")
    func labelForNumberCodeTypeWith4DigitsReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPLabel(digits: 4, codeType: .number)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Label for number code type with 6 digits returns non-empty string")
    func labelForNumberCodeTypeWith6DigitsReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPLabel(digits: 6, codeType: .number)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Label for number code type with 8 digits returns non-empty string")
    func labelForNumberCodeTypeWith8DigitsReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPLabel(digits: 8, codeType: .number)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Label for letter code type with 4 letters returns non-empty string")
    func labelForLetterCodeTypeWith4LettersReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPLabel(digits: 4, codeType: .letter)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Label for letter code type with 6 letters returns non-empty string")
    func labelForLetterCodeTypeWith6LettersReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPLabel(digits: 6, codeType: .letter)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Label for letter code type with 8 letters returns non-empty string")
    func labelForLetterCodeTypeWith8LettersReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPLabel(digits: 8, codeType: .letter)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Label for alphanumeric code type with 4 characters returns non-empty string")
    func labelForAlphanumericCodeTypeWith4CharactersReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPLabel(digits: 4, codeType: .alphanumeric)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Label for alphanumeric code type with 6 characters returns non-empty string")
    func labelForAlphanumericCodeTypeWith6CharactersReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPLabel(digits: 6, codeType: .alphanumeric)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Label for alphanumeric code type with 8 characters returns non-empty string")
    func labelForAlphanumericCodeTypeWith8CharactersReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPLabel(digits: 8, codeType: .alphanumeric)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Label for different code types returns different strings")
    func labelForDifferentCodeTypesReturnsDifferentStrings() {
        // GIVEN
        let digits = 6

        // WHEN
        let numberLabel = String.accessibilityInputOTPLabel(digits: digits, codeType: .number)
        let letterLabel = String.accessibilityInputOTPLabel(digits: digits, codeType: .letter)
        let alphanumericLabel = String.accessibilityInputOTPLabel(digits: digits, codeType: .alphanumeric)

        // THEN
        #expect(numberLabel != letterLabel)
        #expect(numberLabel != alphanumericLabel)
        #expect(letterLabel != alphanumericLabel)
    }

    // MARK: Accessibility Value Complete

    @Test("Value complete for number code type returns non-empty string")
    func valueCompleteForNumberCodeTypeReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPValueComplete(value: "1234", codeType: .number)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Value complete for letter code type returns non-empty string")
    func valueCompleteForLetterCodeTypeReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPValueComplete(value: "ABCD", codeType: .letter)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Value complete for alphanumeric code type returns non-empty string")
    func valueCompleteForAlphanumericCodeTypeReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPValueComplete(value: "A1B2", codeType: .alphanumeric)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Value complete for different code types returns different strings")
    func valueCompleteForDifferentCodeTypesReturnsDifferentStrings() {
        // GIVEN
        let value = "123456"

        // WHEN
        let numberValue = String.accessibilityInputOTPValueComplete(value: value, codeType: .number)
        let letterValue = String.accessibilityInputOTPValueComplete(value: value, codeType: .letter)
        let alphanumericValue = String.accessibilityInputOTPValueComplete(value: value, codeType: .alphanumeric)

        // THEN
        #expect(numberValue != letterValue)
        #expect(numberValue != alphanumericValue)
        #expect(letterValue != alphanumericValue)
    }

    // MARK: Accessibility Value Progress

    @Test("Value progress for number code type with 2 of 6 returns non-empty string")
    func valueProgressForNumberCodeTypeWith2Of6ReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPValueProgress(value: "12", filled: 2, total: 6, codeType: .number)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Value progress for letter code type with 3 of 8 returns non-empty string")
    func valueProgressForLetterCodeTypeWith3Of8ReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPValueProgress(value: "ABC", filled: 3, total: 8, codeType: .letter)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Value progress for alphanumeric code type with 1 of 4 returns non-empty string")
    func valueProgressForAlphanumericCodeTypeWith1Of4ReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPValueProgress(value: "A", filled: 1, total: 4, codeType: .alphanumeric)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Value progress for different code types returns different strings")
    func valueProgressForDifferentCodeTypesReturnsDifferentStrings() {
        // GIVEN
        let value = "123"
        let filled = 3
        let total = 6

        // WHEN
        let numberProgress = String.accessibilityInputOTPValueProgress(value: value, filled: filled, total: total, codeType: .number)
        let letterProgress = String.accessibilityInputOTPValueProgress(value: value, filled: filled, total: total, codeType: .letter)
        let alphanumericProgress = String.accessibilityInputOTPValueProgress(value: value, filled: filled, total: total, codeType: .alphanumeric)

        // THEN
        #expect(numberProgress != letterProgress)
        #expect(numberProgress != alphanumericProgress)
        #expect(letterProgress != alphanumericProgress)
    }

    @Test("Value progress changes with different filled counts")
    func valueProgressChangesWithDifferentFilledCounts() {
        // GIVEN
        let total = 6
        let codeType = InputOTPCodeType.number

        // WHEN
        let progress1 = String.accessibilityInputOTPValueProgress(value: "1", filled: 1, total: total, codeType: codeType)
        let progress2 = String.accessibilityInputOTPValueProgress(value: "12", filled: 2, total: total, codeType: codeType)
        let progress3 = String.accessibilityInputOTPValueProgress(value: "123", filled: 3, total: total, codeType: codeType)

        // THEN
        #expect(progress1 != progress2)
        #expect(progress2 != progress3)
        #expect(progress1 != progress3)
    }

    // MARK: Accessibility Hint

    @Test("Hint default for number code type returns non-empty string")
    func hintDefaultForNumberCodeTypeReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPHintDefault(codeType: .number)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Hint default for letter code type returns non-empty string")
    func hintDefaultForLetterCodeTypeReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPHintDefault(codeType: .letter)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Hint default for alphanumeric code type returns non-empty string")
    func hintDefaultForAlphanumericCodeTypeReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPHintDefault(codeType: .alphanumeric)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Hint default for different code types returns different strings")
    func hintDefaultForDifferentCodeTypesReturnsDifferentStrings() {
        // GIVEN / WHEN
        let numberHint = String.accessibilityInputOTPHintDefault(codeType: .number)
        let letterHint = String.accessibilityInputOTPHintDefault(codeType: .letter)
        let alphanumericHint = String.accessibilityInputOTPHintDefault(codeType: .alphanumeric)

        // THEN
        #expect(numberHint != letterHint)
        #expect(numberHint != alphanumericHint)
        #expect(letterHint != alphanumericHint)
    }

    @Test("Hint error returns non-empty string")
    func hintErrorReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPHintError

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Hint complete returns non-empty string")
    func hintCompleteReturnsNonEmptyString() {
        // GIVEN / WHEN
        let result = String.accessibilityInputOTPHintComplete

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("Hint error and hint complete return different strings")
    func hintErrorAndHintCompleteReturnDifferentStrings() {
        // GIVEN / WHEN
        let errorHint = String.accessibilityInputOTPHintError
        let completeHint = String.accessibilityInputOTPHintComplete

        // THEN
        #expect(errorHint != completeHint)
    }
}
