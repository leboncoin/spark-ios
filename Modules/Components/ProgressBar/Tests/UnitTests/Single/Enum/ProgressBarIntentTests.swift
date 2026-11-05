//
//  ProgressBarIntentTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import Testing

@Suite("Progress Bar Intent Tests")
struct ProgressBarIntentTests {

    // MARK: - Tests

    @Test("Default value")
    func defaultValue() {
        // GIVEN / WHEN
        let defaultIntent = ProgressBarIntent.default

        // THEN
        #expect(defaultIntent == .support)
    }

    @Test("All cases count")
    func allCasesCount() {
        // GIVEN / WHEN
        let allCases = ProgressBarIntent.allCases

        // THEN
        #expect(allCases.count == 8)
    }

    @Test("All cases contain expected values")
    func allCasesContainExpectedValues() {
        // GIVEN / WHEN
        let allCases = ProgressBarIntent.allCases

        // THEN
        #expect(allCases.contains(.accent))
        #expect(allCases.contains(.alert))
        #expect(allCases.contains(.support))
        #expect(allCases.contains(.danger))
        #expect(allCases.contains(.info))
        #expect(allCases.contains(.main))
        #expect(allCases.contains(.neutral))
        #expect(allCases.contains(.success))
        #expect(allCases.contains(.support))
    }
}
