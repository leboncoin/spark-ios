//
//  InputOTPDigits+SeparatorExtensionTests.swift
//  SparkComponentInputOTPTests
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentInputOTP

// MARK: - Tests

struct InputOTPDigitsSeparatorExtensionTests {

    // MARK: - Tests

    @Test
    func isSeparatorShouldReturnExpectedValue() {
        #expect(InputOTPDigits.four.isSeparator == false)
        #expect(InputOTPDigits.six.isSeparator == true)
        #expect(InputOTPDigits.eight.isSeparator == true)
    }

    @Test(arguments: InputOTPDigits.allCases)
    func showSeparatorShouldOnlyBeTrueAtMiddleIndexWhenSeparator(digits: InputOTPDigits) {
        for index in 0..<digits.rawValue {
            #expect(digits.showSeparator(at: index) == (digits.isSeparator && index == digits.rawValue / 2))
        }
    }
}
