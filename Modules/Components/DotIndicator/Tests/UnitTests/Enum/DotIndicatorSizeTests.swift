//
//  DotIndicatorSizeTests.swift
//  SparkComponentDotIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentDotIndicator

// MARK: - Tests

struct DotIndicatorSizeTests {

    @Test("All cases should contain small, medium and large")
    func allCasesShouldContainSmallMediumAndLarge() {
        #expect(DotIndicatorSize.allCases == [.small, .medium, .large])
    }

    @Test("Default should return medium")
    func defaultShouldReturnMedium() {
        #expect(DotIndicatorSize.default == .medium)
    }
}
