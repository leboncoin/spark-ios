//
//  InputOTPSlotBorderTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentInputOTP

@Suite("Input OTP Slot Border Tests")
struct InputOTPSlotBorderTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let border = InputOTPSlotBorder()

        // THEN
        #expect(border.width == .zero)
        #expect(border.radius == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let border1 = InputOTPSlotBorder(width: 2.0, radius: 8.0)
        let border2 = InputOTPSlotBorder(width: 2.0, radius: 8.0)

        // THEN
        #expect(border1 == border2)
    }

    @Test("Inequality when different width")
    func inequalityWhenDifferentWidth() {
        // GIVEN / WHEN
        let border1 = InputOTPSlotBorder(width: 2.0, radius: 8.0)
        let border2 = InputOTPSlotBorder(width: 3.0, radius: 8.0)

        // THEN
        #expect(border1 != border2)
    }

    @Test("Inequality when different radius")
    func inequalityWhenDifferentRadius() {
        // GIVEN / WHEN
        let border1 = InputOTPSlotBorder(width: 2.0, radius: 8.0)
        let border2 = InputOTPSlotBorder(width: 2.0, radius: 12.0)

        // THEN
        #expect(border1 != border2)
    }
}
