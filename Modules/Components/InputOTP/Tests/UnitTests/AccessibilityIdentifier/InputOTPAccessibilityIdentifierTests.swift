//
//  InputOTPAccessibilityIdentifierTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentInputOTP

@Suite("Input OTP Accessibility Identifier Tests")
struct InputOTPAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("View identifier")
    func viewIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(InputOTPAccessibilityIdentifier.view == "spark-input-otp-view")
    }
}
