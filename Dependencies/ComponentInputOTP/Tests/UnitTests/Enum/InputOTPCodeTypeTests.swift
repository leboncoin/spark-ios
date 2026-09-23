//
//  InputOTPCodeTypeTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 05/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
import Testing
import UIKit

@Suite("Input OTP Code Type Tests")
struct InputOTPCodeTypeTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [InputOTPCodeType] = [
            .number,
            .letter,
            .alphanumeric
        ]

        // WHEN / THEN
        #expect(InputOTPCodeType.allCases.count == expectedCases.count)
        #expect(Set(InputOTPCodeType.allCases) == Set(expectedCases))
    }

    @Test("Default value is number")
    func defaultValueIsNumber() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPCodeType.default == .number)
    }

    @Test("Number case keyboard type is numberPad")
    func numberCaseKeyboardTypeIsNumberPad() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPCodeType.number.keyboardType == .numberPad)
    }

    @Test("Letter case keyboard type is alphabet")
    func letterCaseKeyboardTypeIsAlphabet() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPCodeType.letter.keyboardType == .alphabet)
    }

    @Test("Alphanumeric case keyboard type is asciiCapable")
    func alphanumericCaseKeyboardTypeIsAsciiCapable() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPCodeType.alphanumeric.keyboardType == .asciiCapable)
    }
}
