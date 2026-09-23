//
//  RatingDisplaySizeTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentRating

final class RatingDisplaySizeTests: XCTestCase {

    // MARK: - Tests

    func test_default_is_medium() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(RatingDisplaySize.default, .medium)
    }

    func test_raw_values() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(RatingDisplaySize.small.rawValue, 12)
        XCTAssertEqual(RatingDisplaySize.medium.rawValue, 16)
        XCTAssertEqual(RatingDisplaySize.large.rawValue, 24)
    }

    func test_all_cases_only_includes_non_deprecated() {
        // GIVEN / WHEN
        let allCases = RatingDisplaySize.allCases

        // THEN
        XCTAssertEqual(allCases.count, 3)
        XCTAssertTrue(allCases.contains(.small))
        XCTAssertTrue(allCases.contains(.medium))
        XCTAssertTrue(allCases.contains(.large))
        XCTAssertFalse(allCases.contains(.input))
    }

    func test_initialization_from_raw_value() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(RatingDisplaySize(rawValue: 12), .small)
        XCTAssertEqual(RatingDisplaySize(rawValue: 16), .medium)
        XCTAssertEqual(RatingDisplaySize(rawValue: 24), .large)
        XCTAssertEqual(RatingDisplaySize(rawValue: 40), .input)
        XCTAssertNil(RatingDisplaySize(rawValue: 999))
    }

    func test_cgFloat_returns_correct_values() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(RatingDisplaySize.small.cgFloat, 12.0)
        XCTAssertEqual(RatingDisplaySize.medium.cgFloat, 16.0)
        XCTAssertEqual(RatingDisplaySize.large.cgFloat, 24.0)
        XCTAssertEqual(RatingDisplaySize.input.cgFloat, 40.0)
    }
}
