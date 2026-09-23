//
//  CardAccessibilityIdentifierTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard

// MARK: - Tests

@Suite("CardAccessibilityIdentifier Tests")
struct CardAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("Test view identifier")
    func testViewIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(CardAccessibilityIdentifier.view == "spark-card-view")
    }
}
