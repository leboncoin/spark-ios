//
//  ScaledUIPaddingTests.swift
//  SparkCommonTests
//
//  Created on 23/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkCommon

final class ScaledUIPaddingTests: XCTestCase {

    // MARK: - Properties

    private enum Constants {
        static let baseValue: CGFloat = 16.0
        static let minValueFactor = ScaledPaddingConstants.minValueFactor
        static let maxValueFactor = ScaledPaddingConstants.maxValueFactor
    }

    // MARK: - Tests

    func test_init() {
        // GIVEN / WHEN
        let padding = ScaledUIPadding(wrappedValue: Constants.baseValue)

        // THEN
        XCTAssertEqual(padding.wrappedValue, Constants.baseValue)
    }

    func test_wrappedValue_setter() {
        // GIVEN
        var padding = ScaledUIPadding(wrappedValue: Constants.baseValue)
        let newValue: CGFloat = 24.0

        // WHEN
        padding.wrappedValue = newValue

        // THEN
        XCTAssertEqual(padding.wrappedValue, newValue)
    }

    func test_updateTraitCollection() {
        // GIVEN
        var padding = ScaledUIPadding(wrappedValue: Constants.baseValue)
        let traitCollection = UITraitCollection(preferredContentSizeCategory: .large)

        // WHEN
        padding.update(traitCollection: traitCollection)
        let scaledValue = padding.scaledValue(for: traitCollection)

        // THEN
        XCTAssertGreaterThanOrEqual(scaledValue, Constants.baseValue * Constants.minValueFactor)
        XCTAssertLessThanOrEqual(scaledValue, Constants.baseValue * Constants.maxValueFactor)
    }

    func test_scaledValue_with_traitCollection() {
        // GIVEN
        let padding = ScaledUIPadding(wrappedValue: Constants.baseValue)

        // Create trait collections with different content size categories
        let smallTraitCollection = UITraitCollection(preferredContentSizeCategory: .small)
        let largeTraitCollection = UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)

        // WHEN & THEN
        // Test with small content size (should be at least minValue)
        let smallScaledValue = padding.scaledValue(for: smallTraitCollection)
        XCTAssertGreaterThanOrEqual(smallScaledValue, Constants.baseValue * Constants.minValueFactor)

        // Test with large content size (should be at most maxValue)
        let largeScaledValue = padding.scaledValue(for: largeTraitCollection)
        XCTAssertLessThanOrEqual(largeScaledValue, Constants.baseValue * Constants.maxValueFactor)
    }
}
