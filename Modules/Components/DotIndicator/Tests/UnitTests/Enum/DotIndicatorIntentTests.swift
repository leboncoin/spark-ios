//
//  DotIndicatorIntentTests.swift
//  SparkComponentDotIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentDotIndicator

// MARK: - Tests

struct DotIndicatorIntentTests {

    @Test("All cases should contain support and surface")
    func allCasesShouldContainSupportAndSurface() {
        #expect(DotIndicatorIntent.allCases == [.support, .surface])
    }

    @Test("Default should return support")
    func defaultShouldReturnSupport() {
        #expect(DotIndicatorIntent.default == .support)
    }
}
