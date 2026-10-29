//
//  ScaledUIBorderWidthTests.swift
//  SparkTests
//
//  Created on 23/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//
import UIKit
import Testing
@testable import SparkCommon

@MainActor
@Suite("Scaled UI Border Width Tests")
struct ScaledUIBorderWidthTests {

    // MARK: - Tests Init

    @Test("Init")
    func initialization() {
        // GIVEN
        let baseValue: CGFloat = 10

        // WHEN
        let metric = ScaledUIBorderWidth(wrappedValue: baseValue)

        // THEN
        #expect(metric.wrappedValue == baseValue)
    }

    // MARK: - Test Wrapped Value

    @Test("Wrapped value setter")
    func wrappedValueSetter() {
        // GIVEN
        var metric = ScaledUIBorderWidth(wrappedValue: 16.0)

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
        var metric = ScaledUIBorderWidth(wrappedValue: baseValue)

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
        var metric = ScaledUIBorderWidth(wrappedValue: baseValue)
        let mockTraitCollection = UITraitCollection(preferredContentSizeCategory: .extraSmall)

        // WHEN
        metric.update(traitCollection: mockTraitCollection)
        let scaledValue = metric.scaledValue(for: mockTraitCollection)

        // THEN
        #expect(scaledValue == baseValue * ScaledBorderType.width.minValueFactor)
    }

    @Test("Scaled value above maximum")
    func scaledValueAboveMaximum() {
        // GIVEN
        let baseValue: CGFloat = 16.0
        var metric = ScaledUIBorderWidth(wrappedValue: baseValue)
        let mockTraitCollection = UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)

        // WHEN
        metric.update(traitCollection: mockTraitCollection)
        let scaledValue = metric.scaledValue(for: mockTraitCollection)

        // THEN
        #expect(scaledValue == baseValue * ScaledBorderType.width.maxValueFactor)
    }
}
