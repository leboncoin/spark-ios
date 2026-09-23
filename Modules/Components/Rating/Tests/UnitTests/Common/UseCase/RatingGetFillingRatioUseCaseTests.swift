//
//  RatingGetFillingRatioUseCaseTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentRating

final class RatingGetFillingRatioUseCaseTests: XCTestCase {

    // MARK: - Properties

    var sut: RatingGetFillingRatioUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = RatingGetFillingRatioUseCase()
    }

    // MARK: - Tests - Double Rating Method

    func test_execute_with_double_rating() {
        // GIVEN
        let index = 0
        let count = 5
        let rating: Double = 3.0

        // WHEN
        let result = self.sut.execute(index: index, count: count, rating: rating)

        // THEN
        XCTAssertEqual(result, 1)
    }

    func test_execute_with_decimal_rating() {
        // GIVEN
        let index = 0
        let count = 5
        let rating: Double = 3.5

        // WHEN
        let result = self.sut.execute(index: index, count: count, rating: rating)

        // THEN
        XCTAssertEqual(result, 1)
    }

    // MARK: - Tests - Single Star

    func test_execute_single_star_empty() {
        // GIVEN
        typealias Scenario = (
            givenRating: Double,
            expectedFillingRatio: CGFloat
        )

        let scenarios: [Scenario] = [
            (0, 0),
            (0.25, 0),
            (0.5, 0),
            (0.75, 0),
            (1, 0.0),
            (1.25, 0.5),
            (1.5, 0.5),
            (1.75, 0.5),
            (2, 0.5),
            (2.25, 0.5),
            (2.5, 0.5),
            (2.75, 0.5),
            (3, 0.5),
            (3.25, 0.5),
            (3.5, 0.5),
            (3.75, 0.5),
            (4, 1),
            (4.25, 1),
            (4.5, 1),
            (4.75, 1),
            (5, 1),
            (5.5, 1)
        ]

        for scenario in scenarios {
            let filling = self.sut.execute(
                index: 0,
                count: 1,
                rating: scenario.givenRating
            )

            // THEN
            XCTAssertEqual(
                filling,
                scenario.expectedFillingRatio,
                "Wrong 1 when rating is equals to \(scenario.givenRating)"
            )
        }
    }

    // MARK: - Tests - Multiple Stars - Filled

    func test_execute_multiple_stars_with_index_is_0() {
        // GIVEN
        typealias Scenario = (
            givenRating: Double,
            expectedFillingRatio: CGFloat
        )

        let scenarios: [Scenario] = [
            (0, 0),
            (0.24, 0),
            (0.25, 0.5),
            (0.5, 0.5),
            (0.74, 0.5),
            (0.75, 1),
            (1, 1)
        ]

        for scenario in scenarios {
            let filling = self.sut.execute(
                index: 0,
                count: 5,
                rating: scenario.givenRating
            )

            // THEN
            XCTAssertEqual(
                filling,
                scenario.expectedFillingRatio,
                "Wrong 1 when rating is equals to \(scenario.givenRating)"
            )
        }
    }

    func test_execute_multiple_stars_with_index_is_1() {
        // GIVEN
        typealias Scenario = (
            givenRating: Double,
            expectedFillingRatio: CGFloat
        )

        let scenarios: [Scenario] = [
            (0, 0),
            (0.24, 0),
            (0.25, 0),
            (0.5, 0),
            (0.74, 0),
            (0.75, 0),

            (1, 0),
            (1.24, 0),
            (1.25, 0.5),
            (1.5, 0.5),
            (1.74, 0.5),
            (1.75, 1),
            (2, 1)
        ]

        for scenario in scenarios {
            let filling = self.sut.execute(
                index: 1,
                count: 5,
                rating: scenario.givenRating
            )

            // THEN
            XCTAssertEqual(
                filling,
                scenario.expectedFillingRatio,
                "Wrong 1 when rating is equals to \(scenario.givenRating)"
            )
        }
    }

    func test_execute_multiple_stars_with_index_is_1_and_count_is_2() {
        // GIVEN
        typealias Scenario = (
            givenRating: Double,
            expectedFillingRatio: CGFloat
        )

        let scenarios: [Scenario] = [
            (0, 0),
            (0.24, 0),
            (0.25, 0),
            (0.5, 0),
            (0.74, 0),
            (0.75, 0),

            (1, 0),
            (1.24, 0),
            (1.25, 0.5),
            (1.5, 0.5),
            (1.74, 0.5),
            (1.75, 1),

            (2, 1),
            (3, 1),
            (4, 1),
            (5.5, 1),
        ]

        for scenario in scenarios {
            let filling = self.sut.execute(
                index: 1,
                count: 2,
                rating: scenario.givenRating
            )

            // THEN
            XCTAssertEqual(
                filling,
                scenario.expectedFillingRatio,
                "Wrong 1 when rating is equals to \(scenario.givenRating)"
            )
        }
    }

    // MARK: - Tests - Edge Cases

    func test_execute_with_negative_rating() {
        // GIVEN / WHEN
        let result = self.sut.execute(index: 0, count: 5, rating: -1.0)

        // THEN
        XCTAssertEqual(result, 0)
    }

    func test_execute_with_zero_index() {
        // GIVEN / WHEN
        let result = self.sut.execute(index: 0, count: 5, rating: 2.5)

        // THEN
        XCTAssertEqual(result, 1)
    }

    func test_execute_boundary_values() {
        // Test exact boundary values for ratio calculation
        let scenarios: [(Double, CGFloat)] = [
            (0.25, 0.5),
            (0.75, 1.0),
            (0.249, 0),
            (0.751, 1.0)
        ]

        for (rating, expected) in scenarios {
            let result = self.sut.execute(index: 0, count: 5, rating: rating)
            XCTAssertEqual(result, expected, "Failed for rating \(rating)")
        }
    }

    func test_execute_consistency_with_different_double_values() {
        // GIVEN
        let index = 0
        let count = 5

        // WHEN & THEN
        // Test with whole number
        let wholeResult = self.sut.execute(index: index, count: count, rating: 1.0)
        XCTAssertEqual(wholeResult, 1)

        // Test with decimal
        let decimalResult = self.sut.execute(index: index, count: count, rating: 1.5)
        XCTAssertEqual(decimalResult, 1)

        // Both should be the same since rating >= index + 1 (1)
        XCTAssertEqual(wholeResult, decimalResult)
    }
}
