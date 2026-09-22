//
//  CardIntentTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard

// MARK: - Tests

@Suite("CardIntent Tests")
struct CardIntentTests {

    // MARK: - Tests

    @Test("Test all cases")
    func testAllCases() {
        // GIVEN / WHEN
        let expectedCases: [CardIntent] = [
            .accent,
            .alert,
            .error,
            .info,
            .main,
            .neutral,
            .success,
            .support,
            .surface
        ]

        // THEN
        #expect(CardIntent.allCases == expectedCases)
        #expect(CardIntent.allCases.count == 9)
    }

    @Test("Test default value")
    func testDefaultValue() {
        // GIVEN / WHEN / THEN
        #expect(CardIntent.default == .surface)
    }
}
