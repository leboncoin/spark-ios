//
//  DotIndicatorConstantsTests.swift
//  SparkComponentDotIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentDotIndicator

// MARK: - Tests

struct DotIndicatorConstantsTests {

    @Test("Animation duration should return 250ms")
    func animationDurationShouldReturn250ms() {
        #expect(DotIndicatorConstants.animationDuration == 0.25)
    }
}
