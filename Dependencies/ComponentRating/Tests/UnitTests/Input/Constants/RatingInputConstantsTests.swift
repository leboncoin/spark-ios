//
//  RatingInputConstantsTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentRating

final class RatingInputConstantsTests: XCTestCase {

    // MARK: - Tests

    func test_size_constant() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(RatingInputConstants.size, 40.0)
    }

    func test_scaledRatio_constant() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(RatingInputConstants.scaledRatio, 1.5)
    }

    func test_stars_constant() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(RatingInputConstants.stars, 5)
    }

    func test_scaledAnimationDuration_constant() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(RatingInputConstants.scaledAnimationDuration, 0.2)
    }
}
