//
//  RatingGetFillingRatioUseCaseTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentRating

@Suite("Rating Get Filling Ratio Use Case Tests")
struct RatingGetFillingRatioUseCaseTests {

    // MARK: - Properties

    var sut: RatingGetFillingRatioUseCase!

    // MARK: - Setup

    init() {

        self.sut = RatingGetFillingRatioUseCase()
    }

    // MARK: - Tests - Double Rating Method

    @Test("Execute with double rating")
    func executeWithDoubleRating() {
        // GIVEN
        let index = 0
        let count = 5
        let rating: Double = 3.0

        // WHEN
        let result = self.sut.execute(index: index, count: count, rating: rating)

        // THEN
        #expect(result == 1)
    }

    @Test("Execute with decimal rating")
    func executeWithDecimalRating() {
        // GIVEN
        let index = 0
        let count = 5
        let rating: Double = 3.5

        // WHEN
        let result = self.sut.execute(index: index, count: count, rating: rating)

        // THEN
        #expect(result == 1)
    }

    // MARK: - Tests - Single Star

    @Test("Execute single star empty")
    func executeSingleStarEmpty() {
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
            #expect(filling == scenario.expectedFillingRatio, "Wrong 1 when rating is equals to \(scenario.givenRating)")
        }
    }

    // MARK: - Tests - Multiple Stars - Filled

    @Test("Execute multiple stars with index is 0")
    func executeMultipleStarsWithIndexIs0() {
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
            #expect(filling == scenario.expectedFillingRatio, "Wrong 1 when rating is equals to \(scenario.givenRating)")
        }
    }

    @Test("Execute multiple stars with index is 1")
    func executeMultipleStarsWithIndexIs1() {
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
            #expect(filling == scenario.expectedFillingRatio, "Wrong 1 when rating is equals to \(scenario.givenRating)")
        }
    }

    @Test("Execute multiple stars with index is 1 and count is 2")
    func executeMultipleStarsWithIndexIs1AndCountIs2() {
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
            #expect(filling == scenario.expectedFillingRatio, "Wrong 1 when rating is equals to \(scenario.givenRating)")
        }
    }

    // MARK: - Tests - Edge Cases

    @Test("Execute with negative rating")
    func executeWithNegativeRating() {
        // GIVEN / WHEN
        let result = self.sut.execute(index: 0, count: 5, rating: -1.0)

        // THEN
        #expect(result == 0)
    }

    @Test("Execute with zero index")
    func executeWithZeroIndex() {
        // GIVEN / WHEN
        let result = self.sut.execute(index: 0, count: 5, rating: 2.5)

        // THEN
        #expect(result == 1)
    }

    @Test("Execute boundary values")
    func executeBoundaryValues() {
        // Test exact boundary values for ratio calculation
        let scenarios: [(Double, CGFloat)] = [
            (0.25, 0.5),
            (0.75, 1.0),
            (0.249, 0),
            (0.751, 1.0)
        ]

        for (rating, expected) in scenarios {
            let result = self.sut.execute(index: 0, count: 5, rating: rating)
            #expect(result == expected, "Failed for rating \(rating)")
        }
    }

    @Test("Execute consistency with different double values")
    func executeConsistencyWithDifferentDoubleValues() {
        // GIVEN
        let index = 0
        let count = 5

        // WHEN & THEN
        // Test with whole number
        let wholeResult = self.sut.execute(index: index, count: count, rating: 1.0)
        #expect(wholeResult == 1)

        // Test with decimal
        let decimalResult = self.sut.execute(index: index, count: count, rating: 1.5)
        #expect(decimalResult == 1)

        // Both should be the same since rating >= index + 1 (1)
        #expect(wholeResult == decimalResult)
    }
}
