//
//  DotsIndicatorConstantsTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 26/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentDotsIndicator

struct DotsIndicatorConstantsTests {

    // MARK: - Tests

    @Test("Swipe minimum distance constant")
    func swipeMinimumDistanceConstant() {
        #expect(DotsIndicatorConstants.swipeMinimumDistance == 10)
    }

    @Test("Long press minimum duration constant")
    func longPressMinimumDurationConstant() {
        #expect(DotsIndicatorConstants.longPressMinimumDuration == 0.3)
    }
}
