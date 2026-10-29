//
//  DividerIntentTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing

@testable import SparkComponentDivider

@Suite("Divider Intent Tests")
struct DividerIntentTests {

    // MARK: - Tests

    @Test("All cases")
    func allCases() {
        // GIVEN
        let expectedCases: [DividerIntent] = [
            .outline, .outlineHigh
        ]

        // WHEN
        let allCases = DividerIntent.allCases

        // THEN
        #expect(allCases.count == 2, "DividerIntent should have 2 active cases")
        #expect(allCases == expectedCases, "DividerIntent allCases should match expected cases")
    }

    @Test("Default")
    func defaultValue() {
        // GIVEN & WHEN
        let defaultIntent = DividerIntent.default

        // THEN
        #expect(defaultIntent == .outline, "DividerIntent.default should be .outline")
    }
}
