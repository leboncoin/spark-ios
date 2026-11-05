//
//  LimitedScaledUIMetricTests.swift
//  SparkTests
//
//  Created on 23/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//
import UIKit
import Testing
@testable import SparkCommon

@MainActor
@Suite("Limited Scaled UI Metric Tests")
struct LimitedScaledUIMetricTests {

    // MARK: - Tests Inits with Values

    @Test("Init with base value min max and metrics")
    func initWithBaseValueMinMaxAndMetrics() {
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
        #expect(metric.wrappedValue == baseValue)
    }

    @Test("Init with base value min max and metrics when value below min")
    func initWithBaseValueMinMaxAndMetricsWhenValueBelowMin() {
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
        #expect(metric.wrappedValue == minValue)
    }

    @Test("Init with base value min max and metrics when value above max")
    func initWithBaseValueMinMaxAndMetricsWhenValueAboveMax() {
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
        #expect(metric.wrappedValue == maxValue)
    }

    @Test("Init with base value min max and text style")
    func initWithBaseValueMinMaxAndTextStyle() {
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
        #expect(metric.wrappedValue == baseValue)
    }

    @Test("Init with base value min max and text style when value below min")
    func initWithBaseValueMinMaxAndTextStyleWhenValueBelowMin() {
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
        #expect(metric.wrappedValue == minValue)
    }

    @Test("Init with base value min max and text style when value above max")
    func initWithBaseValueMinMaxAndTextStyleWhenValueAboveMax() {
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
        #expect(metric.wrappedValue == maxValue)
    }

    // MARK: - Tests Inits with Factors

    @Test("Init with base value and min max factors and metrics")
    func initWithBaseValueAndMinMaxFactorsAndMetrics() {
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
        #expect(metric.wrappedValue == baseValue)
    }

    @Test("Init with base value and min max factors and text style")
    func initWithBaseValueAndMinMaxFactorsAndTextStyle() {
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
        #expect(metric.wrappedValue == baseValue)
    }

    // MARK: - Tests Inits with Default Factors

    @Test("Init with base value and default factors and metrics")
    func initWithBaseValueAndDefaultFactorsAndMetrics() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            relativeTo: .init(forTextStyle: .body)
        )

        // THEN
        #expect(metric.wrappedValue == baseValue)
    }

    @Test("Init with base value and default factors and text style")
    func initWithBaseValueAndDefaultFactorsAndTextStyle() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledUIMetric(
            wrappedValue: baseValue,
            relativeTo: .headline
        )

        // THEN
        #expect(metric.wrappedValue == baseValue)
    }

    // MARK: - Test Wrapped Value

    @Test("Wrapped value setter")
    func wrappedValueSetter() {
        // GIVEN
        var metric = LimitedScaledUIMetric(wrappedValue: 16.0)

        // WHEN
        let newBaseValue: CGFloat = 20.0
        metric.wrappedValue = newBaseValue

        // THEN
        #expect(metric.wrappedValue == newBaseValue)
    }

    // MARK: - Tests Scale Value

    @Test("Scaled value within range")
    func scaledValueWithinRange() {
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
        #expect(scaledValue >= minValue)
        #expect(scaledValue <= maxValue)
    }

    @Test("Scaled value below minimum")
    func scaledValueBelowMinimum() {
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
        #expect(scaledValue == minValue)
    }

    @Test("Scaled value above maximum")
    func scaledValueAboveMaximum() {
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
        #expect(scaledValue == maxValue)
    }

    // MARK: - Test Update Range

    @Test("Update range values within range")
    func updateRangeValuesWithinRange() {
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
        #expect(metric.wrappedValue == baseValue)
    }

    @Test("Update range values below minimum")
    func updateRangeValuesBelowMinimum() {
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
        #expect(metric.wrappedValue == baseValue * newMinFactor)
    }

    @Test("Update range values above maximum")
    func updateRangeValuesAboveMaximum() {
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
        #expect(metric.wrappedValue == baseValue * newMaxFactor)
    }
}
