//
//  DotsIndicatorIntentTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentDotsIndicator

// MARK: - Tests

struct DotsIndicatorIntentTests {

    @Test("All cases should contain support and surface")
    func allCasesShouldContainSupportAndSurface() {
        #expect(DotsIndicatorIntent.allCases == [.support, .surface])
    }

    @Test("Default should return support")
    func defaultShouldReturnSupport() {
        #expect(DotsIndicatorIntent.default == .support)
    }
}
