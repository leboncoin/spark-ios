//
//  DividerIntentTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest

@testable import SparkComponentDivider

final class DividerIntentTests: XCTestCase {

    // MARK: - Tests

    func test_allCases() {
        // GIVEN
        let expectedCases: [DividerIntent] = [
            .outline, .outlineHigh
        ]

        // WHEN
        let allCases = DividerIntent.allCases

        // THEN
        XCTAssertEqual(allCases.count, 2, "DividerIntent should have 2 active cases")
        XCTAssertEqual(allCases, expectedCases, "DividerIntent allCases should match expected cases")
    }

    func test_default() {
        // GIVEN & WHEN
        let defaultIntent = DividerIntent.default

        // THEN
        XCTAssertEqual(defaultIntent, .outline, "DividerIntent.default should be .outline")
    }
}
