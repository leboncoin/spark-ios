//
//  RatingInputGetNewValueUseCaseTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 15/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentRating

final class RatingInputGetNewValueUseCaseTests: XCTestCase {

    // MARK: - Properties

    var sut: RatingInputGetNewValueUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = RatingInputGetNewValueUseCase()
    }

    // MARK: - Tests - Negative Values

    func test_execute_with_negative_ratio() {
        // GIVEN
        let ratio: CGFloat = -0.5

        // WHEN
        let result = self.sut.execute(ratio: ratio)

        // THEN
        XCTAssertEqual(result, 1.0)
    }

    func test_execute_with_very_negative_ratio() {
        // GIVEN
        let ratio: CGFloat = -10.0

        // WHEN
        let result = self.sut.execute(ratio: ratio)

        // THEN
        XCTAssertEqual(result, 1.0)
    }

    // MARK: - Tests - Normal Range (0 to 1)

    func test_execute_with_partial_ratios() {
        // GIVEN
        let scenarios: [(CGFloat, Double)] = [
            (0.0, 1.0),
            (0.1, 1.0),
            (0.2, 2.0),
            (0.3, 2.0),
            (0.4, 3.0),
            (0.5, 3.0),
            (0.6, 4.0),
            (0.7, 4.0),
            (0.8, 5.0),
            (0.9, 5.0),
            (1.0, 5.0),
            (1.1, 5.0),
            (2.0, 5.0),
            (3.0, 5.0)
        ]

        for (ratio, expectedValue) in scenarios {
            // WHEN
            let result = self.sut.execute(ratio: ratio)

            // THEN
            XCTAssertEqual(result, expectedValue, "Failed for ratio \(ratio)")
        }
    }

    // MARK: - Tests - Boundary Values

    func test_execute_boundary_values() {
        // GIVEN
        let scenarios: [(CGFloat, Double)] = [
            (-0.001, 1.0),
            (0.999, 5.0),
            (1.001, 5.0),
        ]

        for (ratio, expectedValue) in scenarios {
            // WHEN
            let result = self.sut.execute(ratio: ratio)

            // THEN
            XCTAssertEqual(result, expectedValue, "Failed for boundary ratio \(ratio)")
        }
    }

    // MARK: - Tests - Increment Method

    func test_executeIncrement_when_enabled_and_below_max() {
        // GIVEN
        let value = 3.0
        let isEnabled = true

        // WHEN
        let result = self.sut.executeIncrement(value: value, isEnabled: isEnabled)

        // THEN
        XCTAssertEqual(result, 4.0)
    }

    func test_executeIncrement_when_disabled() {
        // GIVEN
        let value = 3.0
        let isEnabled = false

        // WHEN
        let result = self.sut.executeIncrement(value: value, isEnabled: isEnabled)

        // THEN
        XCTAssertNil(result)
    }

    func test_executeIncrement_when_at_max_value() {
        // GIVEN
        let value = 5.0 // Max stars
        let isEnabled = true

        // WHEN
        let result = self.sut.executeIncrement(value: value, isEnabled: isEnabled)

        // THEN
        XCTAssertNil(result)
    }

    func test_executeIncrement_when_above_max_value() {
        // GIVEN
        let value = 6.0
        let isEnabled = true

        // WHEN
        let result = self.sut.executeIncrement(value: value, isEnabled: isEnabled)

        // THEN
        XCTAssertNil(result)
    }

    func test_executeIncrement_with_decimal_value() {
        // GIVEN
        let value = 2.7
        let isEnabled = true

        // WHEN
        let result = self.sut.executeIncrement(value: value, isEnabled: isEnabled)

        // THEN
        XCTAssertEqual(result, 3.0)
    }

    // MARK: - Tests - Decrement Method

    func test_executeDecrement_when_enabled_and_above_min() {
        // GIVEN
        let value = 3.0
        let isEnabled = true

        // WHEN
        let result = self.sut.executeDecrement(value: value, isEnabled: isEnabled)

        // THEN
        XCTAssertEqual(result, 2.0)
    }

    func test_executeDecrement_when_disabled() {
        // GIVEN
        let value = 3.0
        let isEnabled = false

        // WHEN
        let result = self.sut.executeDecrement(value: value, isEnabled: isEnabled)

        // THEN
        XCTAssertNil(result)
    }

    func test_executeDecrement_when_below_min_value() {
        // GIVEN
        let value = 0.5
        let isEnabled = true

        // WHEN
        let result = self.sut.executeDecrement(value: value, isEnabled: isEnabled)

        // THEN
        XCTAssertNil(result)
    }

    func test_executeDecrement_when_at_min_value() {
        // GIVEN
        let value = 1.0
        let isEnabled = true

        // WHEN
        let result = self.sut.executeDecrement(value: value, isEnabled: isEnabled)

        // THEN
        XCTAssertEqual(result, 0.0)
    }

    func test_executeDecrement_with_decimal_value() {
        // GIVEN
        let value = 3.7
        let isEnabled = true

        // WHEN
        let result = self.sut.executeDecrement(value: value, isEnabled: isEnabled)

        // THEN
        XCTAssertEqual(result, 2.0)
    }
}
