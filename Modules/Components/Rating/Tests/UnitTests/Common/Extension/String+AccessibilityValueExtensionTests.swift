//
//  String+AccessibilityValueExtensionTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 15/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentRating

@Suite("String Accessibility Value Extension Tests")
struct StringAccessibilityValueExtensionTests {

    // MARK: - Tests

    @Test("Accessibility value with integer rating")
    func accessibilityValueWithIntegerRating() {
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
        #expect(result.contains(formattedRating))
        #expect(result.contains("5"))
    }

    @Test("Accessibility value with decimal rating")
    func accessibilityValueWithDecimalRating() {
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
        #expect(result.contains(formattedRating))
        #expect(result.contains("5"))
    }

    @Test("Accessibility value with zero rating")
    func accessibilityValueWithZeroRating() {
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
        #expect(result.contains(formattedRating))
        #expect(result.contains("5"))
    }

    @Test("Accessibility value with maximum rating")
    func accessibilityValueWithMaximumRating() {
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
        #expect(result.contains(formattedRating))
        #expect(result.contains("5"))
    }

    @Test("Accessibility value with single star")
    func accessibilityValueWithSingleStar() {
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
        #expect(result.contains(formattedRating))
        #expect(result.contains("1"))
    }

    @Test("Accessibility value with high precision decimal")
    func accessibilityValueWithHighPrecisionDecimal() {
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
        #expect(result.contains(formattedRating))
        #expect(result.contains("5"))
    }

    @Test("Accessibility value formatting uses number formatter")
    func accessibilityValueFormattingUsesNumberFormatter() {
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
        #expect(result.contains(formattedRating))
        #expect(result.contains("5"))
        #expect(!result.isEmpty)
    }

    @Test("Accessibility value returns non empty string")
    func accessibilityValueReturnsNonEmptyString() {
        // GIVEN
        let rating: Double = 3.0
        let numberOfStars = 5

        // WHEN
        let result = String.accessibilityValue(
            rating: rating,
            numberOfStars: numberOfStars
        )

        // THEN
        #expect(!result.isEmpty)
        #expect(result.count > 0)
    }
}
