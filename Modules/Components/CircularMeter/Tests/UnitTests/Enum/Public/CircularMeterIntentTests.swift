//
//  CircularMeterIntentTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentCircularMeter
import Testing

@Suite("Circular Meter Intent Tests")
struct CircularMeterIntentTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [CircularMeterIntent] = [
            .alert,
            .error,
            .info,
            .main,
            .success,
            .support
        ]

        // WHEN / THEN
        #expect(CircularMeterIntent.allCases.count == expectedCases.count)
        #expect(Set(CircularMeterIntent.allCases) == Set(expectedCases))
    }

    @Test("Default value is support")
    func defaultValueIsSupport() {
        // GIVEN / WHEN / THEN
        #expect(CircularMeterIntent.default == .support)
    }
}
