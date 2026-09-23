//
//  ProgressBarShapeTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import XCTest

final class ProgressBarShapeTests: XCTestCase {

    // MARK: - Tests

    func test_default_value() {
        // GIVEN / WHEN
        let defaultShape = ProgressBarShape.default

        // THEN
        XCTAssertEqual(defaultShape, .rounded)
    }

    func test_all_cases_count() {
        // GIVEN / WHEN
        let allCases = ProgressBarShape.allCases

        // THEN
        XCTAssertEqual(allCases.count, 2)
    }

    func test_all_cases_contain_expected_values() {
        // GIVEN / WHEN
        let allCases = ProgressBarShape.allCases

        // THEN
        XCTAssertTrue(allCases.contains(.rounded))
        XCTAssertTrue(allCases.contains(.square))
    }
}
