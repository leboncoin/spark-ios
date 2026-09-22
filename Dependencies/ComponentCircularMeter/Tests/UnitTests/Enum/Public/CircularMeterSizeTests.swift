//
//  CircularMeterSizeTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentCircularMeter
import Testing

@Suite("Circular Meter Size Tests")
struct CircularMeterSizeTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [CircularMeterSize] = [
            .small,
            .medium,
            .large,
            .xLarge
        ]

        // WHEN / THEN
        #expect(CircularMeterSize.allCases.count == expectedCases.count)
        #expect(Set(CircularMeterSize.allCases) == Set(expectedCases))
    }

    @Test("Default value is large")
    func defaultValueIsLarge() {
        // GIVEN / WHEN / THEN
        #expect(CircularMeterSize.default == .large)
    }
}
