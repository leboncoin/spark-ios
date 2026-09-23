//
//  LimitedScaledUIMetricTests.swift
//  SparkTests
//
//  Created on 23/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//
import XCTest
@testable import SparkCommon

class LimitedScaledUIMetricTests: XCTestCase {

    // MARK: - Tests Inits with Values

    func test_init_with_baseValueMinMax_and_metrics() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minValue: 9,
            maxValue: 11,
            relativeTo: .init(forTextStyle: .body)
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }

    func test_init_with_baseValueMinMax_and_metrics_when_value_below_min() {
        // GIVEN
        let baseValue: CGFloat = 1
        let minValue: CGFloat = 8

        // WHEN
        let metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minValue: minValue,
            maxValue: 11,
            relativeTo: .init(forTextStyle: .body)
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, minValue)
    }

    func test_init_with_baseValueMinMax_and_metrics_when_value_above_max() {
        // GIVEN
        let baseValue: CGFloat = 20
        let maxValue: CGFloat = 11

        // WHEN
        let metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minValue: 8,
            maxValue: maxValue,
            relativeTo: .init(forTextStyle: .body)
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, maxValue)
    }

    func test_init_with_baseValueMinMax_and_textStyle() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minValue: 9,
            maxValue: 11,
            relativeTo: .headline
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }

    func test_init_with_baseValueMinMax_and_textStyle_when_value_below_min() {
        // GIVEN
        let baseValue: CGFloat = 1
        let minValue: CGFloat = 8

        // WHEN
        let metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minValue: minValue,
            maxValue: 11,
            relativeTo: .headline
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, minValue)
    }

    func test_init_with_baseValueMinMax_and_textStyle_when_value_above_max() {
        // GIVEN
        let baseValue: CGFloat = 20
        let maxValue: CGFloat = 11

        // WHEN
        let metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minValue: 8,
            maxValue: maxValue,
            relativeTo: .headline
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, maxValue)
    }

    // MARK: - Tests Inits with Factors

    func test_init_with_baseValue_and_minMaxFactors_and_metrics() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minFactor: 0.9,
            maxFactor: 1.1,
            relativeTo: .init(forTextStyle: .body)
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }

    func test_init_with_baseValue_and_minMaxFactors_and_textStyle() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minValue: 9,
            maxValue: 11,
            relativeTo: .headline
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }

    // MARK: - Tests Inits with Default Factors

    func test_init_with_baseValue_and_defaultFactors_and_metrics() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            relativeTo: .init(forTextStyle: .body)
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }

    func test_init_with_baseValue_and_defaultFactors_and_textStyle() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            relativeTo: .headline
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }

    // MARK: - Test Wrapped Value

    func test_wrappedValue_setter() {
        // GIVEN
        var metric = LimitedScaledUIMetric(wrappedValue: 16.0)

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
        var metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minValue: minValue,
            maxValue: maxValue
        )

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
        let baseValue: CGFloat = 16.0
        let minValue: CGFloat = 15.0
        let maxValue: CGFloat = 24.0
        var metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minValue: minValue,
            maxValue: maxValue
        )
        let mockTraitCollection = UITraitCollection(preferredContentSizeCategory: .extraSmall)

        // WHEN
        metric.update(traitCollection: mockTraitCollection)
        let scaledValue = metric.scaledValue(for: mockTraitCollection)

        // THEN
        XCTAssertEqual(scaledValue, minValue)
    }

    func test_scaledValue_above_maximum() {
        // GIVEN
        let baseValue: CGFloat = 16.0
        let minValue: CGFloat = 12.0
        let maxValue: CGFloat = 18.0
        var metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minValue: minValue,
            maxValue: maxValue,
            relativeTo: .caption2
        )
        let mockTraitCollection = UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)

        // WHEN
        metric.update(traitCollection: mockTraitCollection)
        let scaledValue = metric.scaledValue(for: mockTraitCollection)

        // THEN
        XCTAssertEqual(scaledValue, maxValue)
    }

    // MARK: - Test Update Range

    func test_update_range_values_within_range() {
        // GIVEN
        let baseValue: CGFloat = 16.0
        var metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minFactor: 0.6,
            maxFactor: 1.5
        )

        // WHEN
        let newMinFactor: CGFloat = 0.5
        let newMaxFactor: CGFloat = 2.0
        metric.updateRangeValues(minValueFactor: newMinFactor, maxValueFactor: newMaxFactor)

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }

    func test_update_range_values_below_minimum() {
        // GIVEN
        let baseValue: CGFloat = 16.0
        var metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minFactor: 0.75,
            maxFactor: 1.25,
            relativeTo: .body
        )

        // WHEN
        let newMinFactor: CGFloat = 0.9
        metric.update(traitCollection: .init(preferredContentSizeCategory: .extraSmall))
        metric.updateRangeValues(minValueFactor: newMinFactor, maxValueFactor: 2.0)

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue * newMinFactor)
    }

    func test_update_range_values_above_maximum() {
        // GIVEN
        let baseValue: CGFloat = 16.0
        var metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            minFactor: 0.4,
            maxFactor: 1.6,
            relativeTo: .body
        )

        // WHEN
        let newMaxFactor: CGFloat = 1.1
        metric.update(traitCollection: .init(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge))
        metric.updateRangeValues(minValueFactor: 0.5, maxValueFactor: newMaxFactor)

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue * newMaxFactor)
    }
}
