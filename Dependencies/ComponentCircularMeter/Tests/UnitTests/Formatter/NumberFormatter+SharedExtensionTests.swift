//
//  NumberFormatter+SharedExtensionTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 01/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentCircularMeter

@Suite("Number Formatter Shared Extension Tests")
struct NumberFormatterSharedExtensionTests {

    // MARK: - Tests

    @Test("Shared formatter configuration")
    func sharedFormatterConfiguration() {
        // GIVEN / WHEN
        let formatter = NumberFormatter.shared

        // THEN
        #expect(formatter.numberStyle == .percent)
        #expect(formatter.maximumFractionDigits == 0)
    }

    @Test("Shared formatter is singleton")
    func sharedFormatterIsSingleton() {
        // GIVEN / WHEN
        let formatter1 = NumberFormatter.shared
        let formatter2 = NumberFormatter.shared

        // THEN
        #expect(formatter1 === formatter2)
    }

    @Test("Shared formatter formats percentage correctly")
    func sharedFormatterFormatsPercentageCorrectly() {
        // GIVEN
        let formatter = NumberFormatter.shared
        let value: Double = 0.70

        // WHEN
        let result = formatter.string(for: value)

        // THEN
        #expect(result != nil)
        #expect(result?.contains("70") ?? false)
    }

    @Test("Shared formatter formats zero percentage")
    func sharedFormatterFormatsZeroPercentage() {
        // GIVEN
        let formatter = NumberFormatter.shared
        let value: Double = 0.0

        // WHEN
        let result = formatter.string(for: value)

        // THEN
        #expect(result != nil)
        #expect(result?.contains("0") ?? false)
    }

    @Test("Shared formatter formats full percentage")
    func sharedFormatterFormatsFullPercentage() {
        // GIVEN
        let formatter = NumberFormatter.shared
        let value: Double = 1.0

        // WHEN
        let result = formatter.string(for: value)

        // THEN
        #expect(result != nil)
        #expect(result?.contains("100") ?? false)
    }

    @Test("Shared formatter rounds decimal values")
    func sharedFormatterRoundsDecimalValues() {
        // GIVEN
        let formatter = NumberFormatter.shared
        let value: Double = 0.756

        // WHEN
        let result = formatter.string(for: value)

        // THEN
        #expect(result != nil)
        // Should round to 76% (maximumFractionDigits = 0)
        #expect(result?.contains("76") ?? false)
    }
}
