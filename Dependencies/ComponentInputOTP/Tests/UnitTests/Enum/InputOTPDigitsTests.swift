//
//  InputOTPDigitsTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
import Testing

@Suite("Input OTP Digits Tests")
struct InputOTPDigitsTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [InputOTPDigits] = [
            .four,
            .six,
            .eight
        ]

        // WHEN / THEN
        #expect(InputOTPDigits.allCases.count == expectedCases.count)
        #expect(Set(InputOTPDigits.allCases) == Set(expectedCases))
    }

    @Test("Default value is six")
    func defaultValueIsSix() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPDigits.default == .six)
    }

    @Test("Four case raw value is 4")
    func fourCaseRawValueIs4() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPDigits.four.rawValue == 4)
    }

    @Test("Six case raw value is 6")
    func sixCaseRawValueIs6() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPDigits.six.rawValue == 6)
    }

    @Test("Eight case raw value is 8")
    func eightCaseRawValueIs8() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPDigits.eight.rawValue == 8)
    }

    @Test("Init from raw value 4 returns four")
    func initFromRawValue4ReturnsFour() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPDigits(rawValue: 4) == .four)
    }

    @Test("Init from raw value 6 returns six")
    func initFromRawValue6ReturnsSix() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPDigits(rawValue: 6) == .six)
    }

    @Test("Init from raw value 8 returns eight")
    func initFromRawValue8ReturnsEight() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPDigits(rawValue: 8) == .eight)
    }

    @Test("Init from invalid raw value returns nil")
    func initFromInvalidRawValueReturnsNil() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPDigits(rawValue: 5) == nil)
        #expect(InputOTPDigits(rawValue: 0) == nil)
        #expect(InputOTPDigits(rawValue: 10) == nil)
    }
}
