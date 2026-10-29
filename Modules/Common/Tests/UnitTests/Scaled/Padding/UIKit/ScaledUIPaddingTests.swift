//
//  ScaledUIPaddingTests.swift
//  SparkCommonTests
//
//  Created on 23/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import Testing
@testable import SparkCommon

@MainActor
@Suite("Scaled UI Padding Tests")
struct ScaledUIPaddingTests {

    // MARK: - Properties

    private enum Constants {
        static let baseValue: CGFloat = 16.0
        static let minValueFactor = ScaledPaddingConstants.minValueFactor
        static let maxValueFactor = ScaledPaddingConstants.maxValueFactor
    }

    // MARK: - Tests

    @Test("Init")
    func initialization() {
        // GIVEN / WHEN
        let padding = ScaledUIPadding(wrappedValue: Constants.baseValue)

        // THEN
        #expect(padding.wrappedValue == Constants.baseValue)
    }

    @Test("Wrapped value setter")
    func wrappedValueSetter() {
        // GIVEN
        var padding = ScaledUIPadding(wrappedValue: Constants.baseValue)
        let newValue: CGFloat = 24.0

        // WHEN
        padding.wrappedValue = newValue

        // THEN
        #expect(padding.wrappedValue == newValue)
    }

    @Test("Update trait collection")
    func updateTraitCollection() {
        // GIVEN
        var padding = ScaledUIPadding(wrappedValue: Constants.baseValue)
        let traitCollection = UITraitCollection(preferredContentSizeCategory: .large)

        // WHEN
        padding.update(traitCollection: traitCollection)
        let scaledValue = padding.scaledValue(for: traitCollection)

        // THEN
        #expect(scaledValue >= Constants.baseValue * Constants.minValueFactor)
        #expect(scaledValue <= Constants.baseValue * Constants.maxValueFactor)
    }

    @Test("Scaled value with trait collection")
    func scaledValueWithTraitCollection() {
        // GIVEN
        let padding = ScaledUIPadding(wrappedValue: Constants.baseValue)

        // Create trait collections with different content size categories
        let smallTraitCollection = UITraitCollection(preferredContentSizeCategory: .small)
        let largeTraitCollection = UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)

        // WHEN & THEN
        // Test with small content size (should be at least minValue)
        let smallScaledValue = padding.scaledValue(for: smallTraitCollection)
        #expect(smallScaledValue >= Constants.baseValue * Constants.minValueFactor)

        // Test with large content size (should be at most maxValue)
        let largeScaledValue = padding.scaledValue(for: largeTraitCollection)
        #expect(largeScaledValue <= Constants.baseValue * Constants.maxValueFactor)
    }
}
