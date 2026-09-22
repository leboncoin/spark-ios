//
//  RatingDisplaySpacingsTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 14/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentRating

final class RatingDisplaySpacingsTests: XCTestCase {

    // MARK: - Tests

    func test_default_initialization() {
        // GIVEN / WHEN
        let spacings = RatingDisplaySpacings()

        // THEN
        XCTAssertEqual(spacings.content, 0.0)
        XCTAssertEqual(spacings.stars, 0.0)
    }

    func test_custom_initialization() {
        // GIVEN / WHEN
        let contentValue: CGFloat = 12.0
        let starsValue: CGFloat = 8.0

        let spacings = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue
        )

        // THEN
        XCTAssertEqual(spacings.content, contentValue)
        XCTAssertEqual(spacings.stars, starsValue)
    }

    func test_equality_when_same_properties() {
        // GIVEN / WHEN
        let contentValue: CGFloat = 10.0
        let starsValue: CGFloat = 5.0

        let spacings1 = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue
        )

        let spacings2 = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue
        )

        // THEN
        XCTAssertEqual(spacings1, spacings2)
    }

    func test_inequality_when_different_content_spacing() {
        // GIVEN / WHEN
        let contentValue1: CGFloat = 10.0
        let contentValue2: CGFloat = 12.0
        let starsValue: CGFloat = 5.0

        let spacings1 = RatingDisplaySpacings(
            content: contentValue1,
            stars: starsValue
        )

        let spacings2 = RatingDisplaySpacings(
            content: contentValue2,
            stars: starsValue
        )

        // THEN
        XCTAssertNotEqual(spacings1, spacings2)
    }

    func test_inequality_when_different_stars_spacing() {
        // GIVEN / WHEN
        let contentValue: CGFloat = 10.0
        let starsValue1: CGFloat = 5.0
        let starsValue2: CGFloat = 8.0

        let spacings1 = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue1
        )

        let spacings2 = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue2
        )

        // THEN
        XCTAssertNotEqual(spacings1, spacings2)
    }

    func test_hash_consistency() {
        // GIVEN
        let contentValue: CGFloat = 15.0
        let starsValue: CGFloat = 7.0

        let spacings1 = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue
        )

        let spacings2 = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue
        )

        // WHEN
        var hasher1 = Hasher()
        spacings1.hash(into: &hasher1)
        let hash1 = hasher1.finalize()

        var hasher2 = Hasher()
        spacings2.hash(into: &hasher2)
        let hash2 = hasher2.finalize()

        // THEN
        XCTAssertEqual(hash1, hash2)
    }
}