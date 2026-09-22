//
//  DividerAxisTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest

@testable import SparkComponentDivider

final class DividerAxisTests: XCTestCase {

    // MARK: - Tests

    func test_allCases() {
        // GIVEN
        let expectedCases: [DividerAxis] = [.horizontal, .vertical]

        // WHEN
        let allCases = DividerAxis.allCases

        // THEN
        XCTAssertEqual(allCases.count, 2, "DividerAxis should have 2 cases")
        XCTAssertEqual(allCases, expectedCases, "DividerAxis allCases should match expected cases")
    }

    func test_default() {
        // GIVEN & WHEN
        let defaultAxis = DividerAxis.default

        // THEN
        XCTAssertEqual(defaultAxis, .horizontal, "DividerAxis.default should be .horizontal")
    }

    func test_uikit() {
        // GIVEN
        let axis1 = DividerAxis.horizontal
        let axis2 = DividerAxis.vertical

        // WHEN
        let uikitAxis1 = axis1.uikit
        let uikitAxis2 = axis2.uikit

        // THEN
        XCTAssertEqual(uikitAxis1, .horizontal, "Wrong UIKit for uikitAxis1")
        XCTAssertEqual(uikitAxis2, .vertical, "Wrong UIKit for uikitAxis2")
    }
}
