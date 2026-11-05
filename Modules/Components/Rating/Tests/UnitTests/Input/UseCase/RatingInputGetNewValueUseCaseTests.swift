//
//  RatingInputGetNewValueUseCaseTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 15/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentRating

@Suite("Rating Input Get New Value Use Case Tests")
struct RatingInputGetNewValueUseCaseTests {

    // MARK: - Properties

    var sut: RatingInputGetNewValueUseCase!

    // MARK: - Setup

    init() {

        self.sut = RatingInputGetNewValueUseCase()
    }

    // MARK: - Tests - Negative Values

    @Test("Execute with negative ratio")
    func executeWithNegativeRatio() {
        // GIVEN
        let ratio: CGFloat = -0.5

        // WHEN
        let result = self.sut.execute(ratio: ratio)

        // THEN
        #expect(result == 1.0)
    }

    @Test("Execute with very negative ratio")
    func executeWithVeryNegativeRatio() {
        // GIVEN
        let ratio: CGFloat = -10.0

        // WHEN
        let result = self.sut.execute(ratio: ratio)

        // THEN
        #expect(result == 1.0)
    }

    // MARK: - Tests - Normal Range (0 to 1)

    @Test("Execute with partial ratios")
    func executeWithPartialRatios() {
        // GIVEN
        let scenarios: [(CGFloat, Double)] = [
            (0.0, 1.0),
            (0.1, 1.0),
            (0.2, 2.0),
            (0.3, 2.0),
            (0.4, 3.0),
            (0.5, 3.0),
            (0.6, 4.0),
            (0.7, 4.0),
            (0.8, 5.0),
            (0.9, 5.0),
            (1.0, 5.0),
            (1.1, 5.0),
            (2.0, 5.0),
            (3.0, 5.0)
        ]

        for (ratio, expectedValue) in scenarios {
            // WHEN
            let result = self.sut.execute(ratio: ratio)

            // THEN
            #expect(result == expectedValue, "Failed for ratio \(ratio)")
        }
    }

    // MARK: - Tests - Boundary Values

    @Test("Execute boundary values")
    func executeBoundaryValues() {
        // GIVEN
        let scenarios: [(CGFloat, Double)] = [
            (-0.001, 1.0),
            (0.999, 5.0),
            (1.001, 5.0),
        ]

        for (ratio, expectedValue) in scenarios {
            // WHEN
            let result = self.sut.execute(ratio: ratio)

            // THEN
            #expect(result == expectedValue, "Failed for boundary ratio \(ratio)")
        }
    }

    // MARK: - Tests - Increment Method

    @Test("Execute increment when enabled and below max")
    func executeIncrementWhenEnabledAndBelowMax() {
        // GIVEN
        let value = 3.0
        let isEnabled = true

        // WHEN
        let result = self.sut.executeIncrement(value: value, isEnabled: isEnabled)

        // THEN
        #expect(result == 4.0)
    }

    @Test("Execute increment when disabled")
    func executeIncrementWhenDisabled() {
        // GIVEN
        let value = 3.0
        let isEnabled = false

        // WHEN
        let result = self.sut.executeIncrement(value: value, isEnabled: isEnabled)

        // THEN
        #expect(result == nil)
    }

    @Test("Execute increment when at max value")
    func executeIncrementWhenAtMaxValue() {
        // GIVEN
        let value = 5.0 // Max stars
        let isEnabled = true

        // WHEN
        let result = self.sut.executeIncrement(value: value, isEnabled: isEnabled)

        // THEN
        #expect(result == nil)
    }

    @Test("Execute increment when above max value")
    func executeIncrementWhenAboveMaxValue() {
        // GIVEN
        let value = 6.0
        let isEnabled = true

        // WHEN
        let result = self.sut.executeIncrement(value: value, isEnabled: isEnabled)

        // THEN
        #expect(result == nil)
    }

    @Test("Execute increment with decimal value")
    func executeIncrementWithDecimalValue() {
        // GIVEN
        let value = 2.7
        let isEnabled = true

        // WHEN
        let result = self.sut.executeIncrement(value: value, isEnabled: isEnabled)

        // THEN
        #expect(result == 3.0)
    }

    // MARK: - Tests - Decrement Method

    @Test("Execute decrement when enabled and above min")
    func executeDecrementWhenEnabledAndAboveMin() {
        // GIVEN
        let value = 3.0
        let isEnabled = true

        // WHEN
        let result = self.sut.executeDecrement(value: value, isEnabled: isEnabled)

        // THEN
        #expect(result == 2.0)
    }

    @Test("Execute decrement when disabled")
    func executeDecrementWhenDisabled() {
        // GIVEN
        let value = 3.0
        let isEnabled = false

        // WHEN
        let result = self.sut.executeDecrement(value: value, isEnabled: isEnabled)

        // THEN
        #expect(result == nil)
    }

    @Test("Execute decrement when below min value")
    func executeDecrementWhenBelowMinValue() {
        // GIVEN
        let value = 0.5
        let isEnabled = true

        // WHEN
        let result = self.sut.executeDecrement(value: value, isEnabled: isEnabled)

        // THEN
        #expect(result == nil)
    }

    @Test("Execute decrement when at min value")
    func executeDecrementWhenAtMinValue() {
        // GIVEN
        let value = 1.0
        let isEnabled = true

        // WHEN
        let result = self.sut.executeDecrement(value: value, isEnabled: isEnabled)

        // THEN
        #expect(result == 0.0)
    }

    @Test("Execute decrement with decimal value")
    func executeDecrementWithDecimalValue() {
        // GIVEN
        let value = 3.7
        let isEnabled = true

        // WHEN
        let result = self.sut.executeDecrement(value: value, isEnabled: isEnabled)

        // THEN
        #expect(result == 2.0)
    }
}
