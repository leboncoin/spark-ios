//
//  ScaledUIBorderRadiusTests.swift
//  SparkTests
//
//  Created on 23/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//
import XCTest
@testable import SparkCommon

class ScaledUIBorderRadiusTests: XCTestCase {

    // MARK: - Tests Init

    func test_init() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = ScaledUIBorderRadius(wrappedValue: baseValue)

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }

    // MARK: - Test Wrapped Value

    func test_wrappedValue_setter() {
        // GIVEN
        var metric = ScaledUIBorderRadius(wrappedValue: 16.0)

        // WHEN
        let newBaseValue: CGFloat = 20.0
        metric.wrappedValue = newBaseValue

        // THEN
        XCTAssertEqual(metric.wrappedValue, newBaseValue)
    }

    // MARK: - Tests Scale Value

    func test_scaledValue_within_range() {
        // GIVEN
        let baseValue: CGFloat = 16.0
        let minValue: CGFloat = 12.0
        let maxValue: CGFloat = 24.0
        var metric = ScaledUIBorderRadius(wrappedValue: baseValue)

        let mockTraitCollection = UITraitCollection(preferredContentSizeCategory: .large)

        // WHEN
        metric.update(traitCollection: mockTraitCollection)
        let scaledValue = metric.scaledValue(for: mockTraitCollection)

        // THEN
        XCTAssertGreaterThanOrEqual(scaledValue, minValue)
        XCTAssertLessThanOrEqual(scaledValue, maxValue)
    }

    func test_scaledValue_below_minimum() {
        // GIVEN
        let baseValue: CGFloat = 1
        var metric = ScaledUIBorderRadius(wrappedValue: baseValue)
        let mockTraitCollection = UITraitCollection(preferredContentSizeCategory: .medium)

        // WHEN
        metric.update(traitCollection: mockTraitCollection)
        let scaledValue = metric.scaledValue(for: mockTraitCollection)

        // THEN
        XCTAssertEqual(scaledValue, baseValue * ScaledBorderType.radius.minValueFactor)
    }

    func test_scaledValue_above_maximum() {
        // GIVEN
        let baseValue: CGFloat = 16.0
        var metric = ScaledUIBorderRadius(wrappedValue: baseValue)
        let mockTraitCollection = UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)

        // WHEN
        metric.update(traitCollection: mockTraitCollection)
        let scaledValue = metric.scaledValue(for: mockTraitCollection)

        // THEN
        XCTAssertEqual(scaledValue, baseValue * ScaledBorderType.radius.maxValueFactor)
    }
}
