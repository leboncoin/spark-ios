//
//  AwarenessCardAccessibilityIdentifierTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard

// MARK: - Tests

@Suite("AwarenessCardAccessibilityIdentifier Tests")
struct AwarenessCardAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("View identifier value")
    func testViewIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(AwarenessCardAccessibilityIdentifier.view == "spark-awareness-card-view")
    }
}
