//
//  Double+FormattedValueExtensionTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 01/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentCircularMeter

@Suite("Double Formatted Value Extension Tests")
struct DoubleFormattedValueExtensionTests {

    // MARK: - ValidatedValue Tests

    @Test("Validate value returns same value when in valid range")
    func validatedValueReturnsSameValueWhenInValidRange() {
        // GIVEN
        let value: Double = 0.70

        // WHEN
        let result = value.validatedValue

        // THEN
        #expect(result == 0.70)
    }

    @Test("Validate value clamps negative value to zero")
    func validatedValueClampsNegativeValueToZero() {
        // GIVEN
        let value: Double = -0.5

        // WHEN
        let result = value.validatedValue

        // THEN
        #expect(result == 0.0)
    }

    @Test("Validate value clamps value above one to one")
    func validatedValueClampsValueAboveOneToOne() {
        // GIVEN
        let value: Double = 1.5

        // WHEN
        let result = value.validatedValue

        // THEN
        #expect(result == 1.0)
    }

    @Test("Validate value returns zero for zero")
    func validatedValueReturnsZeroForZero() {
        // GIVEN
        let value: Double = 0.0

        // WHEN
        let result = value.validatedValue

        // THEN
        #expect(result == 0.0)
    }

    @Test("Validate value returns one for one")
    func validatedValueReturnsOneForOne() {
        // GIVEN
        let value: Double = 1.0

        // WHEN
        let result = value.validatedValue

        // THEN
        #expect(result == 1.0)
    }

    @Test("Validate value with very small negative value")
    func validatedValueWithVerySmallNegativeValue() {
        // GIVEN
        let value: Double = -0.01

        // WHEN
        let result = value.validatedValue

        // THEN
        #expect(result == 0.0)
    }

    @Test("Validate value with very large positive value")
    func validatedValueWithVeryLargePositiveValue() {
        // GIVEN
        let value: Double = 100.0

        // WHEN
        let result = value.validatedValue

        // THEN
        #expect(result == 1.0)
    }

    @Test("Validate value with value slightly above one")
    func validatedValueWithValueSlightlyAboveOne() {
        // GIVEN
        let value: Double = 1.01

        // WHEN
        let result = value.validatedValue

        // THEN
        #expect(result == 1.0)
    }

    @Test("Validate value with value slightly below zero")
    func validatedValueWithValueSlightlyBelowZero() {
        // GIVEN
        let value: Double = -0.001

        // WHEN
        let result = value.validatedValue

        // THEN
        #expect(result == 0.0)
    }

    @Test("Validate value with mid range value")
    func validatedValueWithMidRangeValue() {
        // GIVEN
        let value: Double = 0.5

        // WHEN
        let result = value.validatedValue

        // THEN
        #expect(result == 0.5)
    }

    @Test("Validate value with small valid value")
    func validatedValueWithSmallValidValue() {
        // GIVEN
        let value: Double = 0.01

        // WHEN
        let result = value.validatedValue

        // THEN
        #expect(result == 0.01)
    }

    @Test("Validate value with near maximum valid value")
    func validatedValueWithNearMaximumValidValue() {
        // GIVEN
        let value: Double = 0.99

        // WHEN
        let result = value.validatedValue

        // THEN
        #expect(result == 0.99)
    }

    // MARK: ToPercentageString Tests

    @Test("To percentage string with integer value")
    func toPercentageStringWithIntegerValue() {
        // GIVEN
        let value: Double = 0.70

        // WHEN
        let result = value.toPercentageString()

        // THEN
        #expect(result.contains("70"))
        #expect(!result.isEmpty)
    }

    @Test("To percentage string with zero value")
    func toPercentageStringWithZeroValue() {
        // GIVEN
        let value: Double = 0.0

        // WHEN
        let result = value.toPercentageString()

        // THEN
        #expect(result.contains("0"))
        #expect(!result.isEmpty)
    }

    @Test("To percentage string with full value")
    func toPercentageStringWithFullValue() {
        // GIVEN
        let value: Double = 1.0

        // WHEN
        let result = value.toPercentageString()

        // THEN
        #expect(result.contains("100"))
        #expect(!result.isEmpty)
    }

    @Test("To percentage string with decimal value")
    func toPercentageStringWithDecimalValue() {
        // GIVEN
        let value: Double = 0.756

        // WHEN
        let result = value.toPercentageString()

        // THEN
        // Should round to 76% (maximumFractionDigits = 0 by default)
        #expect(result.contains("76"))
        #expect(!result.isEmpty)
    }

    @Test("To percentage string with high precision decimal")
    func toPercentageStringWithHighPrecisionDecimal() {
        // GIVEN
        let value: Double = 0.123456789

        // WHEN
        let result = value.toPercentageString()

        // THEN
        // Should round to 12% (maximumFractionDigits = 0 by default)
        #expect(result.contains("12"))
        #expect(!result.isEmpty)
    }

    @Test("To percentage string uses number formatter")
    func toPercentageStringUsesNumberFormatter() {
        // GIVEN
        let value: Double = 0.5
        let formattedValue = NumberFormatter.shared.string(for: value) ?? ""

        // WHEN
        let result = value.toPercentageString()

        // THEN
        #expect(result == formattedValue)
        #expect(!result.isEmpty)
    }

    @Test("To percentage string returns non empty string")
    func toPercentageStringReturnsNonEmptyString() {
        // GIVEN
        let value: Double = 0.3

        // WHEN
        let result = value.toPercentageString()

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("To percentage string with small value")
    func toPercentageStringWithSmallValue() {
        // GIVEN
        let value: Double = 0.01

        // WHEN
        let result = value.toPercentageString()

        // THEN
        #expect(result.contains("1"))
        #expect(!result.isEmpty)
    }

    @Test("To percentage string with near full value")
    func toPercentageStringWithNearFullValue() {
        // GIVEN
        let value: Double = 0.99

        // WHEN
        let result = value.toPercentageString()

        // THEN
        #expect(result.contains("99"))
        #expect(!result.isEmpty)
    }

    @Test("To percentage string with mid range value")
    func toPercentageStringWithMidRangeValue() {
        // GIVEN
        let value: Double = 0.5

        // WHEN
        let result = value.toPercentageString()

        // THEN
        #expect(result.contains("50"))
        #expect(!result.isEmpty)
    }

    @Test("To percentage string consistency across multiple calls")
    func toPercentageStringConsistencyAcrossMultipleCalls() {
        // GIVEN
        let value: Double = 0.75

        // WHEN
        let result1 = value.toPercentageString()
        let result2 = value.toPercentageString()

        // THEN
        #expect(result1 == result2)
        #expect(!result1.isEmpty)
    }
}
