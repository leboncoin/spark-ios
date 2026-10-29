//
//  ProgressBarShapeTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import Testing

@Suite("Progress Bar Shape Tests")
struct ProgressBarShapeTests {

    // MARK: - Tests

    @Test("Default value")
    func defaultValue() {
        // GIVEN / WHEN
        let defaultShape = ProgressBarShape.default

        // THEN
        #expect(defaultShape == .rounded)
    }

    @Test("All cases count")
    func allCasesCount() {
        // GIVEN / WHEN
        let allCases = ProgressBarShape.allCases

        // THEN
        #expect(allCases.count == 2)
    }

    @Test("All cases contain expected values")
    func allCasesContainExpectedValues() {
        // GIVEN / WHEN
        let allCases = ProgressBarShape.allCases

        // THEN
        #expect(allCases.contains(.rounded))
        #expect(allCases.contains(.square))
    }
}
