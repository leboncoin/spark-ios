//
//  String+AddParenthesesExtensionTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 11/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentRating

final class StringAddParenthesesExtensionTests: XCTestCase {

    // MARK: - Tests

    func test_addParentheses_with_simple_text() {
        // GIVEN
        let text = "120"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(120)")
    }

    func test_addParentheses_with_single_character() {
        // GIVEN
        let text = "1"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(1)")
    }

    func test_addParentheses_with_empty_string() {
        // GIVEN
        let text = ""

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "()")
    }

    func test_addParentheses_with_long_text() {
        // GIVEN
        let text = "999999"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(999999)")
    }

    func test_addParentheses_with_text_containing_spaces() {
        // GIVEN
        let text = "100 reviews"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(100 reviews)")
    }

    func test_addParentheses_with_already_parenthesized_text() {
        // GIVEN
        let text = "(50)"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(50)")
    }

    func test_addParentheses_with_only_opening_parenthesis() {
        // GIVEN
        let text = "(50"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(50)")
    }

    func test_addParentheses_with_only_closing_parenthesis() {
        // GIVEN
        let text = "50)"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(50)")
    }

    func test_addParentheses_with_multiple_nested_parentheses() {
        // GIVEN
        let text = "((50))"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "((50))")
    }

    func test_addParentheses_with_parentheses_in_middle() {
        // GIVEN
        let text = "50 (test) 100"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(50 (test) 100)")
    }

    func test_addParentheses_with_special_characters() {
        // GIVEN
        let text = "1.5k+"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(1.5k+)")
    }

    func test_addParentheses_with_formatted_number() {
        // GIVEN
        let text = "1,234"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(1,234)")
    }

    func test_addParentheses_with_whitespace_only() {
        // GIVEN
        let text = "   "

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(   )")
    }

    func test_addParentheses_with_unicode_characters() {
        // GIVEN
        let text = "100 ⭐"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(100 ⭐)")
    }

    func test_addParentheses_with_multiline_text() {
        // GIVEN
        let text = "line1\nline2"

        // WHEN
        let result = text.addParentheses

        // THEN
        XCTAssertEqual(result, "(line1\nline2)")
    }
}
