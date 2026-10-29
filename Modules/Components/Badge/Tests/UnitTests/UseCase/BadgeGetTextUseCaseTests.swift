//
//  BadgeGetTextUseCaseTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentBadge

@Suite("Badge Get Text UseCase Tests")
struct BadgeGetTextUseCaseTests {

    // MARK: - Properties

    private let sut: BadgeGetTextUseCase

    // MARK: - Initialization

    init() {
        self.sut = BadgeGetTextUseCase()
    }

    // MARK: - Tests

    @Test("Execute with nil value should return nil")
    func executeWithNilValueShouldReturnNil() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: nil,
            unit: nil
        )

        // THEN
        #expect(result == nil)
    }

    @Test("Execute with nil value and unit should return nil")
    func executeWithNilValueAndUnitShouldReturnNil() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: nil,
            unit: "€"
        )

        // THEN
        #expect(result == nil)
    }

    @Test("Execute with value and nil unit should return string value")
    func executeWithValueAndNilUnitShouldReturnStringValue() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 5,
            unit: nil
        )

        // THEN
        #expect(result == "5")
    }

    @Test("Execute with value and unit should return concatenated string")
    func executeWithValueAndUnitShouldReturnConcatenatedString() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 10,
            unit: "€"
        )

        // THEN
        #expect(result == "10€")
    }

    @Test("Execute with zero value and nil unit should return zero string")
    func executeWithZeroValueAndNilUnitShouldReturnZeroString() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 0,
            unit: nil
        )

        // THEN
        #expect(result == "0")
    }

    @Test("Execute with zero value and unit should return concatenated string")
    func executeWithZeroValueAndUnitShouldReturnConcatenatedString() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 0,
            unit: "€"
        )

        // THEN
        #expect(result == "0€")
    }

    @Test("Execute with value below max and nil unit should return string value")
    func executeWithValueBelowMaxAndNilUnitShouldReturnStringValue() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 50,
            unit: nil
        )

        // THEN
        #expect(result == "50")
    }

    @Test("Execute with value at max and nil unit should return string value")
    func executeWithValueAtMaxAndNilUnitShouldReturnStringValue() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 99,
            unit: nil
        )

        // THEN
        #expect(result == "99")
    }

    @Test("Execute with value above max and nil unit should return max value")
    func executeWithValueAboveMaxAndNilUnitShouldReturnMaxValue() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 150,
            unit: nil
        )

        // THEN
        #expect(result == "99+")
    }

    @Test("Execute with value above max and unit should return max value with unit")
    func executeWithValueAboveMaxAndUnitShouldReturnMaxValueWithUnit() {
        // GIVEN / WHEN
        let result = self.sut.execute(
            value: 200,
            unit: "€"
        )

        // THEN
        #expect(result == "99+€")
    }
}
