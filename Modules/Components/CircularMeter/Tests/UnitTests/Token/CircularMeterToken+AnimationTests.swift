//
//  CircularMeterToken+AnimationTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by Robin Lemaire on 25/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentCircularMeter

// MARK: - Tests

struct CircularMeterTokenAnimationTests {

    // MARK: - Properties

    private let token = CircularMeterToken.Animation()

    // MARK: - Tests

    @Test("value duration should return 0.3")
    func valueDurationShouldReturnValue() {
        #expect(self.token.valueDuration == 0.3)
    }

    @Test("value should return easeOut with value duration")
    func valueShouldReturnEaseOut() {
        #expect(self.token.value == .easeOut(duration: 0.3))
    }

    // MARK: - Equatable Tests

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(CircularMeterToken.Animation() == CircularMeterToken.Animation())
    }
}
