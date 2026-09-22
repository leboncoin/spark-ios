//
//  InputOTPValidatedValueTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentInputOTP

@Suite("Input OTP Validated Value Tests")
struct InputOTPValidatedValueTests {

    // MARK: - Tests

    @Test("Default initialization with value")
    func defaultInitializationWithValue() {
        // GIVEN
        let value = "1234"

        // WHEN
        let validatedValue = InputOTPValidatedValue(value: value)

        // THEN
        #expect(validatedValue.value == "1234")
        #expect(validatedValue.hadInvalidCharacters == false)
    }

    @Test("Initialization with all properties")
    func initializationWithAllProperties() {
        // GIVEN
        let value = "ABCD"
        let hadInvalidCharacters = true

        // WHEN
        let validatedValue = InputOTPValidatedValue(
            value: value,
            hadInvalidCharacters: hadInvalidCharacters
        )

        // THEN
        #expect(validatedValue.value == "ABCD")
        #expect(validatedValue.hadInvalidCharacters == true)
    }

    @Test("Equality when same properties")
    func equalityWhenSameProperties() {
        // GIVEN / WHEN
        let validatedValue1 = InputOTPValidatedValue(
            value: "123",
            hadInvalidCharacters: true
        )

        let validatedValue2 = InputOTPValidatedValue(
            value: "123",
            hadInvalidCharacters: true
        )

        // THEN
        #expect(validatedValue1 == validatedValue2)
    }

    @Test("Inequality when different value")
    func inequalityWhenDifferentValue() {
        // GIVEN / WHEN
        let validatedValue1 = InputOTPValidatedValue(
            value: "123",
            hadInvalidCharacters: false
        )

        let validatedValue2 = InputOTPValidatedValue(
            value: "456",
            hadInvalidCharacters: false
        )

        // THEN
        #expect(validatedValue1 != validatedValue2)
    }

    @Test("Inequality when different hadInvalidCharacters")
    func inequalityWhenDifferentLastCharacterIsFiltered() {
        // GIVEN / WHEN
        let validatedValue1 = InputOTPValidatedValue(
            value: "123",
            hadInvalidCharacters: false
        )

        let validatedValue2 = InputOTPValidatedValue(
            value: "123",
            hadInvalidCharacters: true
        )

        // THEN
        #expect(validatedValue1 != validatedValue2)
    }

    @Test("Inequality when both properties differ")
    func inequalityWhenBothPropertiesDiffer() {
        // GIVEN / WHEN
        let validatedValue1 = InputOTPValidatedValue(
            value: "ABC",
            hadInvalidCharacters: false
        )

        let validatedValue2 = InputOTPValidatedValue(
            value: "XYZ",
            hadInvalidCharacters: true
        )

        // THEN
        #expect(validatedValue1 != validatedValue2)
    }

    @Test("Empty value")
    func emptyValue() {
        // GIVEN / WHEN
        let validatedValue = InputOTPValidatedValue(value: "")

        // THEN
        #expect(validatedValue.value.isEmpty)
        #expect(validatedValue.hadInvalidCharacters == false)
    }
}
