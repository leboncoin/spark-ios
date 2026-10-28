//
//  InputOTPConstantsTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentInputOTP

@Suite("Input OTP Constants Tests")
struct InputOTPConstantsTests {

    // MARK: - Tests

    @Test("Content empty constant")
    func contentEmptyConstant() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPConstants.Content.empty == "-")
    }

    @Test("Content focus constant")
    func contentFocusConstant() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPConstants.Content.focus == "|")
    }
}
