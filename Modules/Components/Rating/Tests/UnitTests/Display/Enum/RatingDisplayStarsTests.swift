//
//  RatingDisplayStarsTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentRating

final class RatingDisplayStarsTests: XCTestCase {

    // MARK: - Tests

    func test_default_is_five() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(RatingDisplayStars.default, .five)
    }

    func test_raw_values() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(RatingDisplayStars.one.rawValue, 1)
        XCTAssertEqual(RatingDisplayStars.five.rawValue, 5)
    }

    func test_all_cases() {
        // GIVEN / WHEN
        let allCases = RatingDisplayStars.allCases

        // THEN
        XCTAssertEqual(allCases.count, 2)
        XCTAssertTrue(allCases.contains(.one))
        XCTAssertTrue(allCases.contains(.five))
    }

    func test_initialization_from_raw_value() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(RatingDisplayStars(rawValue: 1), .one)
        XCTAssertEqual(RatingDisplayStars(rawValue: 5), .five)
        XCTAssertNil(RatingDisplayStars(rawValue: 3))
        XCTAssertNil(RatingDisplayStars(rawValue: 999))
    }
}
