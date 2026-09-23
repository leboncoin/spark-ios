//
//  CircularMeterConstantsTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 02/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentCircularMeter

@Suite("Circular Meter Constants Tests")
struct CircularMeterConstantsTests {

    // MARK: - Tests

    @Test("Animation duration is 0.3")
    func animationDurationIs0Point3() {
        // GIVEN / WHEN
        let duration = CircularMeterConstants.Animation.duration

        // THEN
        #expect(duration == 0.3)
    }

    @Test("Animation duration is a positive value")
    func animationDurationIsPositive() {
        // GIVEN / WHEN
        let duration = CircularMeterConstants.Animation.duration

        // THEN
        #expect(duration > 0)
    }

    @Test("Animation duration is less than 1 second")
    func animationDurationIsLessThanOneSecond() {
        // GIVEN / WHEN
        let duration = CircularMeterConstants.Animation.duration

        // THEN
        #expect(duration < 1.0)
    }

    @Test("Animation duration type is Double")
    func animationDurationTypeIsDouble() {
        // GIVEN / WHEN
        let duration = CircularMeterConstants.Animation.duration

        // THEN
        #expect(duration is Double)
    }
}
