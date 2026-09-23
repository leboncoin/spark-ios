//
//  InputOTPLayoutTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentInputOTP

@Suite("Input OTP Layout Tests")
struct InputOTPLayoutTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let layout = InputOTPLayout()

        // THEN
        #expect(layout.spacing == .zero)
        #expect(layout.padding == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let layout1 = InputOTPLayout(spacing: 8.0, padding: 16.0)
        let layout2 = InputOTPLayout(spacing: 8.0, padding: 16.0)

        // THEN
        #expect(layout1 == layout2)
    }

    @Test("Inequality when different spacing")
    func inequalityWhenDifferentSpacing() {
        // GIVEN / WHEN
        let layout1 = InputOTPLayout(spacing: 8.0, padding: 16.0)
        let layout2 = InputOTPLayout(spacing: 12.0, padding: 16.0)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different padding")
    func inequalityWhenDifferentPadding() {
        // GIVEN / WHEN
        let layout1 = InputOTPLayout(spacing: 8.0, padding: 16.0)
        let layout2 = InputOTPLayout(spacing: 8.0, padding: 20.0)

        // THEN
        #expect(layout1 != layout2)
    }
}
