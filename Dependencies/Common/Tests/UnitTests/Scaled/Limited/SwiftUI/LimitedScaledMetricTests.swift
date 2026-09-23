//
//  LimitedScaledMetricTests.swift
//  SparkCommonTests
//
//  Created on 23/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//
import XCTest
import SwiftUI
@testable import SparkCommon

final class LimitedScaledMetricTests: XCTestCase {

    // MARK: - Tests Inits with Values

    func test_init_with_values() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledMetric(
            value: baseValue,
            minValue: 8,
            maxValue: 12
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }

    func test_init_with_values_when_value_below_min() {
        // GIVEN
        let baseValue: CGFloat = 1
        let minValue: CGFloat = 8

        // WHEN
        let metric = LimitedScaledMetric(
            value: baseValue,
            minValue: minValue,
            maxValue: 12,
            relativeTo: .caption2
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, minValue)
    }

    func test_init_with_values_when_value_above_max() {
        // GIVEN
        let baseValue: CGFloat = 20
        let maxValue: CGFloat = 12

        // WHEN
        let metric = LimitedScaledMetric(
            value: baseValue,
            minValue: 8,
            maxValue: maxValue,
            relativeTo: .caption2
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, maxValue)
    }

    // MARK: - Tests Inits with Factors

    func test_init_with_factors() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledMetric(
            value: baseValue,
            minFactor: 0.9,
            maxFactor: 1.1,
            relativeTo: .caption2
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }

    func test_init_with_default_factors() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledMetric(
            value: baseValue,
            relativeTo: .caption2
        )

        // THEN
        XCTAssertEqual(metric.wrappedValue, baseValue)
    }
}
