//
//  String+AccessibilityLabelDisplayCountExtensionTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 11/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentRating

final class StringAccessibilityLabelDisplayCountExtensionTests: XCTestCase {

    // MARK: - Tests

    func test_accessibilityLabelDisplayCount_with_valid_text() {
        // GIVEN
        let text = "100"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.contains("100") ?? false)
        XCTAssertFalse(result?.isEmpty ?? true)
    }

    func test_accessibilityLabelDisplayCount_with_numeric_string() {
        // GIVEN
        let text = "42"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.contains("42") ?? false)
    }

    func test_accessibilityLabelDisplayCount_with_formatted_number() {
        // GIVEN
        let text = "1,234"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.contains("1,234") ?? false)
    }

    func test_accessibilityLabelDisplayCount_with_single_digit() {
        // GIVEN
        let text = "1"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.contains("1") ?? false)
    }

    func test_accessibilityLabelDisplayCount_with_large_number() {
        // GIVEN
        let text = "999999"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.contains("999999") ?? false)
    }

    func test_accessibilityLabelDisplayCount_with_zero() {
        // GIVEN
        let text = "0"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.contains("0") ?? false)
    }

    func test_accessibilityLabelDisplayCount_with_empty_string() {
        // GIVEN
        let text = ""

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        XCTAssertNotNil(result)
        XCTAssertFalse(result?.isEmpty ?? true)
    }

    func test_accessibilityLabelDisplayCount_with_nil_text() {
        // GIVEN
        let text: String? = nil

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        XCTAssertNil(result)
    }

    func test_accessibilityLabelDisplayCount_with_whitespace() {
        // GIVEN
        let text = "   "

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.contains("   ") ?? false)
    }

    func test_accessibilityLabelDisplayCount_with_text_containing_special_characters() {
        // GIVEN
        let text = "1.5k"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.contains("1.5k") ?? false)
    }

    func test_accessibilityLabelDisplayCount_returns_non_empty_for_valid_input() {
        // GIVEN
        let text = "50"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        XCTAssertNotNil(result)
        XCTAssertGreaterThan(result?.count ?? 0, text.count)
    }

    func test_accessibilityLabelDisplayCount_with_alphanumeric_text() {
        // GIVEN
        let text = "2.5k+"

        // WHEN
        let result = String.accessibilityLabelDisplayCount(text: text)

        // THEN
        XCTAssertNotNil(result)
        XCTAssertTrue(result?.contains("2.5k+") ?? false)
    }
}
