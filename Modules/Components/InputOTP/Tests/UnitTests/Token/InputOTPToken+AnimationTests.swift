//
//  InputOTPToken+AnimationTests.swift
//  SparkComponentInputOTPTests
//
//  Created by Robin Lemaire on 25/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentInputOTP

// MARK: - Tests

struct InputOTPTokenAnimationTests {

    // MARK: - Properties

    private let token = InputOTPToken.Animation()

    // MARK: - Tests

    @Test("cursorBlink duration should return 0.5")
    func cursorBlinkDurationShouldReturnValue() {
        #expect(self.token.cursorBlinkDuration == 0.5)
    }

    // MARK: - Equatable Tests

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(InputOTPToken.Animation() == InputOTPToken.Animation())
    }
}
