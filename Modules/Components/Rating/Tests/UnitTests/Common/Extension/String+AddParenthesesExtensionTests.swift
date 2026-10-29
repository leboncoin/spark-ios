//
//  String+AddParenthesesExtensionTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 11/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentRating

@Suite("String Add Parentheses Extension Tests")
struct StringAddParenthesesExtensionTests {

    // MARK: - Tests

    @Test("Add parentheses with simple text")
    func addParenthesesWithSimpleText() {
        // GIVEN
        let text = "120"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(120)")
    }

    @Test("Add parentheses with single character")
    func addParenthesesWithSingleCharacter() {
        // GIVEN
        let text = "1"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(1)")
    }

    @Test("Add parentheses with empty string")
    func addParenthesesWithEmptyString() {
        // GIVEN
        let text = ""

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "()")
    }

    @Test("Add parentheses with long text")
    func addParenthesesWithLongText() {
        // GIVEN
        let text = "999999"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(999999)")
    }

    @Test("Add parentheses with text containing spaces")
    func addParenthesesWithTextContainingSpaces() {
        // GIVEN
        let text = "100 reviews"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(100 reviews)")
    }

    @Test("Add parentheses with already parenthesized text")
    func addParenthesesWithAlreadyParenthesizedText() {
        // GIVEN
        let text = "(50)"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(50)")
    }

    @Test("Add parentheses with only opening parenthesis")
    func addParenthesesWithOnlyOpeningParenthesis() {
        // GIVEN
        let text = "(50"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(50)")
    }

    @Test("Add parentheses with only closing parenthesis")
    func addParenthesesWithOnlyClosingParenthesis() {
        // GIVEN
        let text = "50)"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(50)")
    }

    @Test("Add parentheses with multiple nested parentheses")
    func addParenthesesWithMultipleNestedParentheses() {
        // GIVEN
        let text = "((50))"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "((50))")
    }

    @Test("Add parentheses with parentheses in middle")
    func addParenthesesWithParenthesesInMiddle() {
        // GIVEN
        let text = "50 (test) 100"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(50 (test) 100)")
    }

    @Test("Add parentheses with special characters")
    func addParenthesesWithSpecialCharacters() {
        // GIVEN
        let text = "1.5k+"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(1.5k+)")
    }

    @Test("Add parentheses with formatted number")
    func addParenthesesWithFormattedNumber() {
        // GIVEN
        let text = "1,234"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(1,234)")
    }

    @Test("Add parentheses with whitespace only")
    func addParenthesesWithWhitespaceOnly() {
        // GIVEN
        let text = "   "

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(   )")
    }

    @Test("Add parentheses with unicode characters")
    func addParenthesesWithUnicodeCharacters() {
        // GIVEN
        let text = "100 ⭐"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(100 ⭐)")
    }

    @Test("Add parentheses with multiline text")
    func addParenthesesWithMultilineText() {
        // GIVEN
        let text = "line1\nline2"

        // WHEN
        let result = text.addParentheses

        // THEN
        #expect(result == "(line1\nline2)")
    }
}
