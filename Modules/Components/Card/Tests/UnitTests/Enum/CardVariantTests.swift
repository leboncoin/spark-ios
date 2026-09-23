//
//  CardVariantTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard

// MARK: - Tests

@Suite("CardVariant Tests")
struct CardVariantTests {

    // MARK: - Tests

    @Test("Test all cases")
    func testAllCases() {
        // GIVEN / WHEN
        let expectedCases: [CardVariant] = [
            .outlined,
            .tinted
        ]

        // THEN
        #expect(CardVariant.allCases == expectedCases)
        #expect(CardVariant.allCases.count == 2)
    }

    @Test("Test default value")
    func testDefaultValue() {
        // GIVEN / WHEN / THEN
        #expect(CardVariant.default == .tinted)
    }
}
