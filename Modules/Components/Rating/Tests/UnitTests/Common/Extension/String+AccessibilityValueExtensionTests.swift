//
//  String+AccessibilityValueExtensionTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 15/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentRating

final class StringAccessibilityValueExtensionTests: XCTestCase {

    // MARK: - Tests

    func test_accessibilityValue_with_integer_rating() {
        // GIVEN
        let rating: Double = 4.0
        let formattedRating = NumberFormatter.shared.string(for: rating) ?? "unknow"
        let numberOfStars = 5

        // WHEN
        let result = String.accessibilityValue(
            rating: rating,
            numberOfStars: numberOfStars
        )

        // THEN
        XCTAssertTrue(result.contains(formattedRating))
        XCTAssertTrue(result.contains("5"))
    }

    func test_accessibilityValue_with_decimal_rating() {
        // GIVEN
        let rating: Double = 3.75
        let formattedRating = NumberFormatter.shared.string(for: rating) ?? "unknow"
        let numberOfStars = 5

        // WHEN
        let result = String.accessibilityValue(
            rating: rating,
            numberOfStars: numberOfStars
        )

        // THEN
        XCTAssertTrue(result.contains(formattedRating))
        XCTAssertTrue(result.contains("5"))
    }

    func test_accessibilityValue_with_zero_rating() {
        // GIVEN
        let rating: Double = 0.0
        let formattedRating = NumberFormatter.shared.string(for: rating) ?? "unknow"
        let numberOfStars = 5

        // WHEN
        let result = String.accessibilityValue(
            rating: rating,
            numberOfStars: numberOfStars
        )

        // THEN
        XCTAssertTrue(result.contains(formattedRating))
        XCTAssertTrue(result.contains("5"))
    }

    func test_accessibilityValue_with_maximum_rating() {
        // GIVEN
        let rating: Double = 5.0
        let formattedRating = NumberFormatter.shared.string(for: rating) ?? "unknow"
        let numberOfStars = 5

        // WHEN
        let result = String.accessibilityValue(
            rating: rating,
            numberOfStars: numberOfStars
        )

        // THEN
        XCTAssertTrue(result.contains(formattedRating))
        XCTAssertTrue(result.contains("5"))
    }

    func test_accessibilityValue_with_single_star() {
        // GIVEN
        let rating: Double = 1.0
        let formattedRating = NumberFormatter.shared.string(for: rating) ?? "unknow"
        let numberOfStars = 1

        // WHEN
        let result = String.accessibilityValue(
            rating: rating,
            numberOfStars: numberOfStars
        )

        // THEN
        XCTAssertTrue(result.contains(formattedRating))
        XCTAssertTrue(result.contains("1"))
    }

    func test_accessibilityValue_with_high_precision_decimal() {
        // GIVEN
        let rating: Double = 2.123456789
        let formattedRating = NumberFormatter.shared.string(for: rating) ?? "unknow"
        let numberOfStars = 5

        // WHEN
        let result = String.accessibilityValue(
            rating: rating,
            numberOfStars: numberOfStars
        )

        // THEN
        XCTAssertTrue(result.contains(formattedRating))
        XCTAssertTrue(result.contains("5"))
    }

    func test_accessibilityValue_formatting_uses_number_formatter() {
        // GIVEN
        let rating: Double = 1.5
        let formattedRating = NumberFormatter.shared.string(for: rating) ?? "unknow"
        let numberOfStars = 5

        // WHEN
        let result = String.accessibilityValue(
            rating: rating,
            numberOfStars: numberOfStars
        )

        // THEN
        XCTAssertTrue(result.contains(formattedRating))
        XCTAssertTrue(result.contains("5"))
        XCTAssertFalse(result.isEmpty)
    }

    func test_accessibilityValue_returns_non_empty_string() {
        // GIVEN
        let rating: Double = 3.0
        let numberOfStars = 5

        // WHEN
        let result = String.accessibilityValue(
            rating: rating,
            numberOfStars: numberOfStars
        )

        // THEN
        XCTAssertFalse(result.isEmpty)
        XCTAssertGreaterThan(result.count, 0)
    }
}
