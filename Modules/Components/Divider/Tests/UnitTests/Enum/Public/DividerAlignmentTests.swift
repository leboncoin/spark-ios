//
//  DividerAlignmentTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing

@testable import SparkComponentDivider

@Suite("Divider Alignment Tests")
struct DividerAlignmentTests {

    // MARK: - Tests

    @Test("All cases")
    func allCases() {
        // GIVEN
        let expectedCases: [DividerAlignment] = [.top, .trailing, .bottom, .leading, .center]

        // WHEN
        let allCases = DividerAlignment.allCases

        // THEN
        #expect(allCases.count == 5, "DividerAlignment should have 5 cases")
        #expect(allCases == expectedCases, "DividerAlignment allCases should match expected cases")
    }

    @Test("Default")
    func defaultValue() {
        // GIVEN & WHEN
        let defaultAlignment = DividerAlignment.default

        // THEN
        #expect(defaultAlignment == .center, "DividerAlignment.default should be .center")
    }
}
