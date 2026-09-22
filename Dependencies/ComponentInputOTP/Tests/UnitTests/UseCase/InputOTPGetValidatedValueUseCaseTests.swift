//
//  InputOTPGetValidatedValueUseCaseTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 05/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
import Testing

@Suite("Input OTP Get Validated Value Use Case Tests")
struct InputOTPGetValidatedValueUseCaseTests {

    // MARK: - Properties

    let sut: InputOTPGetValidatedValueUseCase

    // MARK: - Initialization

    init() {
        self.sut = InputOTPGetValidatedValueUseCase()
    }

    // MARK: - Tests - Number CodeType

    @Test("Returns only numbers when codeType is number")
    func returnsOnlyNumbersWhenCodeTypeIsNumber() throws {
        // GIVEN
        let givenValue = "12A34B56"
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "123456")
        #expect(result.hadInvalidCharacters == true)
    }

    @Test("Returns empty string when codeType is number and value contains only letters")
    func returnsEmptyStringWhenCodeTypeIsNumberAndValueContainsOnlyLetters() throws {
        // GIVEN
        let givenValue = "ABCDEF"
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value.isEmpty)
        #expect(result.hadInvalidCharacters == true)
    }

    // MARK: - Tests - Letter CodeType

    @Test("Returns only letters uppercased when codeType is letter")
    func returnsOnlyLettersUppercasedWhenCodeTypeIsLetter() throws {
        // GIVEN
        let givenValue = "a1B2c3"
        let givenCodeType: InputOTPCodeType = .letter
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "ABC")
        #expect(result.hadInvalidCharacters == true)
    }

    @Test("Returns empty string when codeType is letter and value contains only numbers")
    func returnsEmptyStringWhenCodeTypeIsLetterAndValueContainsOnlyNumbers() throws {
        // GIVEN
        let givenValue = "123456"
        let givenCodeType: InputOTPCodeType = .letter
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value.isEmpty)
        #expect(result.hadInvalidCharacters == true)
    }

    // MARK: - Tests - Alphanumeric CodeType

    @Test("Returns numbers and letters uppercased when codeType is alphanumeric")
    func returnsNumbersAndLettersUppercasedWhenCodeTypeIsAlphanumeric() throws {
        // GIVEN
        let givenValue = "a1B2c3!@#"
        let givenCodeType: InputOTPCodeType = .alphanumeric
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "A1B2C3")
        #expect(result.hadInvalidCharacters == true)
    }

    @Test("Filters special characters and uppercases when codeType is alphanumeric")
    func filtersSpecialCharactersAndUppercasesWhenCodeTypeIsAlphanumeric() throws {
        // GIVEN
        let givenValue = "1!2@3#a$b%c"
        let givenCodeType: InputOTPCodeType = .alphanumeric
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "123ABC")
        #expect(result.hadInvalidCharacters == true)
    }

    @Test("Replaces last alphanumeric character when value exceeds digit count and uppercases")
    func replacesLastAlphanumericCharacterWhenValueExceedsDigitCountAndUppercases() throws {
        // GIVEN
        let givenValue = "a1b2c3d4e5"
        let givenCodeType: InputOTPCodeType = .alphanumeric
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "A1B2C5")
        #expect(result.hadInvalidCharacters == false)
    }

    // MARK: - Tests - Different Digit Counts

    @Test("Works with four digits")
    func worksWithFourDigits() throws {
        // GIVEN
        let givenValue = "1234"
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .four

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "1234")
        #expect(result.hadInvalidCharacters == false)
    }

    @Test("Works with six digits and replaces last when exceeding")
    func worksWithSixDigitsAndReplacesLastWhenExceeding() throws {
        // GIVEN
        let givenValue = "12345678"
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "123458")
        #expect(result.hadInvalidCharacters == false)
    }

    @Test("Works with eight digits and replaces last when exceeding")
    func worksWithEightDigitsAndReplacesLastWhenExceeding() throws {
        // GIVEN
        let givenValue = "1234567890"
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .eight

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "12345670")
        #expect(result.hadInvalidCharacters == false)
    }

    // MARK: - Tests - Edge Cases

    @Test("Returns empty string when value is empty")
    func returnsEmptyStringWhenValueIsEmpty() throws {
        // GIVEN
        let givenValue = ""
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value.isEmpty)
        #expect(result.hadInvalidCharacters == false)
    }

    @Test("Returns value unchanged when already valid and exact length")
    func returnsValueUnchangedWhenAlreadyValidAndExactLength() throws {
        // GIVEN
        let givenValue = "123456"
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "123456")
        #expect(result.hadInvalidCharacters == false)
    }

    @Test("Returns shorter value when valid but shorter than digit count")
    func returnsShorterValueWhenValidButShorterThanDigitCount() throws {
        // GIVEN
        let givenValue = "123"
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "123")
        #expect(result.hadInvalidCharacters == false)
    }

    // MARK: - Tests - Uppercase Behavior

    @Test("Converts lowercase letters to uppercase")
    func convertsLowercaseLettersToUppercase() throws {
        // GIVEN
        let givenValue = "abcdef"
        let givenCodeType: InputOTPCodeType = .letter
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "ABCDEF")
        #expect(result.hadInvalidCharacters == false)
    }

    @Test("Converts mixed case letters to uppercase")
    func convertsMixedCaseLettersToUppercase() throws {
        // GIVEN
        let givenValue = "aBcDeF"
        let givenCodeType: InputOTPCodeType = .letter
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "ABCDEF")
        #expect(result.hadInvalidCharacters == false)
    }

    @Test("Converts alphanumeric mixed case to uppercase")
    func convertsAlphanumericMixedCaseToUppercase() throws {
        // GIVEN
        let givenValue = "a1b2C3"
        let givenCodeType: InputOTPCodeType = .alphanumeric
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "A1B2C3")
        #expect(result.hadInvalidCharacters == false)
    }

    // MARK: - Tests - Replace Last Character When Full

    @Test("Replaces last character when value exceeds max length by one")
    func replacesLastCharacterWhenValueExceedsMaxLengthByOne() throws {
        // GIVEN
        let givenValue = "1234567"
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "123457")
        #expect(result.hadInvalidCharacters == false)
    }

    @Test("Replaces last character when value exceeds max length by multiple characters")
    func replacesLastCharacterWhenValueExceedsMaxLengthByMultipleCharacters() throws {
        // GIVEN
        let givenValue = "123456789"
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "123459")
        #expect(result.hadInvalidCharacters == false)
    }

    @Test("Replaces last letter when value exceeds max length")
    func replacesLastLetterWhenValueExceedsMaxLength() throws {
        // GIVEN
        let givenValue = "abcdefg"
        let givenCodeType: InputOTPCodeType = .letter
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "ABCDEG")
        #expect(result.hadInvalidCharacters == false)
    }

    @Test("Replaces last alphanumeric character when value exceeds max length")
    func replacesLastAlphanumericCharacterWhenValueExceedsMaxLength() throws {
        // GIVEN
        let givenValue = "a1b2c3d4"
        let givenCodeType: InputOTPCodeType = .alphanumeric
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "A1B2C4")
        #expect(result.hadInvalidCharacters == false)
    }

    @Test("Replaces last character with four digits")
    func replacesLastCharacterWithFourDigits() throws {
        // GIVEN
        let givenValue = "12345"
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .four

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "1235")
        #expect(result.hadInvalidCharacters == false)
    }

    @Test("Replaces last character with eight digits")
    func replacesLastCharacterWithEightDigits() throws {
        // GIVEN
        let givenValue = "123456789"
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .eight

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "12345679")
        #expect(result.hadInvalidCharacters == false)
    }

    @Test("Replaces last character and filters invalid characters")
    func replacesLastCharacterAndFiltersInvalidCharacters() throws {
        // GIVEN
        let givenValue = "123456abc7"
        let givenCodeType: InputOTPCodeType = .number
        let givenDigits: InputOTPDigits = .six

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "123457")
        #expect(result.hadInvalidCharacters == true)
    }

    @Test("Replaces last character and uppercases for letters")
    func replacesLastCharacterAndUppercasesForLetters() throws {
        // GIVEN
        let givenValue = "abcdefg"
        let givenCodeType: InputOTPCodeType = .letter
        let givenDigits: InputOTPDigits = .four

        // WHEN
        let result = self.sut.execute(
            value: givenValue,
            codeType: givenCodeType,
            digits: givenDigits
        )

        // THEN
        #expect(result.value == "ABCG")
        #expect(result.hadInvalidCharacters == false)
    }
}
