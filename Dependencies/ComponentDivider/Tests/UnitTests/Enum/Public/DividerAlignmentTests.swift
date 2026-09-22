//
//  DividerAlignmentTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest

@testable import SparkComponentDivider

final class DividerAlignmentTests: XCTestCase {

    // MARK: - Tests

    func test_allCases() {
        // GIVEN
        let expectedCases: [DividerAlignment] = [.top, .trailing, .bottom, .leading, .center]

        // WHEN
        let allCases = DividerAlignment.allCases

        // THEN
        XCTAssertEqual(allCases.count, 5, "DividerAlignment should have 5 cases")
        XCTAssertEqual(allCases, expectedCases, "DividerAlignment allCases should match expected cases")
    }

    func test_default() {
        // GIVEN & WHEN
        let defaultAlignment = DividerAlignment.default

        // THEN
        XCTAssertEqual(defaultAlignment, .center, "DividerAlignment.default should be .center")
    }
}
