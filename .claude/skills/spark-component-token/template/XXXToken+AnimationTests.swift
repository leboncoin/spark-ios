//
//  XXXToken+AnimationTests.swift
//  SparkComponentXXXTests
//
//  Created by {Firstname Lastname} on DD/MM/YYYY.
//  Copyright © YYYY Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentXXX
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct XXXTokenAnimationTests {

    // MARK: - Properties

    private let token = XXXToken.Animation()

    // MARK: - Tests

    @Test("Fast duration should return 0.1")
    func fastDurationShouldReturn01() {
        #expect(self.token.fastDuration == 0.1)
    }

    @Test("Slow duration should return 0.3")
    func slowDurationShouldReturn03() {
        #expect(self.token.slowDuration == 0.3)
    }

    @Test("Fast should return ease in out with fast duration")
    func fastShouldReturnEaseInOutWithFastDuration() {
        #expect(self.token.fast == .easeInOut(duration: 0.1))
    }

    @Test("Slow should return ease in out with slow duration")
    func slowShouldReturnEaseInOutWithSlowDuration() {
        #expect(self.token.slow == .easeInOut(duration: 0.3))
    }

    // MARK: - Equatable Tests

    @Test("Equatable should return true")
    func equatableShouldReturnTrue() {
        #expect(XXXToken.Animation() == XXXToken.Animation())
    }
}
