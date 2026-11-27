//
//  DotsIndicatorToken+AnimationTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 25/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentDotsIndicator

// MARK: - Tests

struct DotsIndicatorTokenAnimationTests {

    // MARK: - Properties

    private let token = DotsIndicatorToken.Animation()

    // MARK: - Tests

    @Test("activeDot duration should return 0.25")
    func activeDotDurationShouldReturnValue() {
        #expect(self.token.activeDotDuration == 0.25)
    }

    @Test("activeDot should return an ease in out animation")
    func activeDotShouldReturnValue() {
        #expect(self.token.activeDot == .easeInOut(duration: 0.25))
    }

    // MARK: - Equatable Tests

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(DotsIndicatorToken.Animation() == DotsIndicatorToken.Animation())
    }
}
