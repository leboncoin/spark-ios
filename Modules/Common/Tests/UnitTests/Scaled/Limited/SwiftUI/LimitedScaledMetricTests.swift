//
//  LimitedScaledMetricTests.swift
//  SparkCommonTests
//
//  Created on 23/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//
import Testing
import SwiftUI
@testable import SparkCommon

@MainActor
@Suite("Limited Scaled Metric Tests")
struct LimitedScaledMetricTests {

    // MARK: - Tests Inits with Values

    @Test("Init with values")
    func initWithValues() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledMetric(
            value: baseValue,
            minValue: 8,
            maxValue: 12
        )

        // THEN
        #expect(metric.wrappedValue == baseValue)
    }

    @Test("Init with values when value below min")
    func initWithValuesWhenValueBelowMin() {
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
        #expect(metric.wrappedValue == minValue)
    }

    @Test("Init with values when value above max")
    func initWithValuesWhenValueAboveMax() {
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
        #expect(metric.wrappedValue == maxValue)
    }

    // MARK: - Tests Inits with Factors

    @Test("Init with factors")
    func initWithFactors() {
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
        #expect(metric.wrappedValue == baseValue)
    }

    @Test("Init with default factors")
    func initWithDefaultFactors() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = LimitedScaledMetric(
            value: baseValue,
            relativeTo: .caption2
        )

        // THEN
        #expect(metric.wrappedValue == baseValue)
    }
}
