//
//  DotsIndicatorSizeTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentDotsIndicator

// MARK: - Tests

struct DotsIndicatorSizeTests {

    @Test("All cases should contain small, medium and large")
    func allCasesShouldContainSmallMediumAndLarge() {
        #expect(DotsIndicatorSize.allCases == [.small, .medium, .large])
    }

    @Test("Default should return medium")
    func defaultShouldReturnMedium() {
        #expect(DotsIndicatorSize.default == .medium)
    }
}
