//
//  ProgressBarGetIsIndicatorHiddenUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentProgressBar

final class ProgressBarGetIsIndicatorHiddenUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_returns_true_when_value_is_zero() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenValue: 0.0,
            expectedResult: true
        )
    }

    func test_execute_returns_false_when_value_is_one() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenValue: 1.0,
            expectedResult: false
        )
    }

    func test_execute_returns_false_when_value_is_in_positive_range() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenValue: 0.5,
            expectedResult: false
        )
    }

    func test_execute_returns_true_when_value_is_negative() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenValue: -0.1,
            expectedResult: true
        )
    }

    func test_execute_returns_false_when_value_is_greater_than_one() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenValue: 1.1,
            expectedResult: false
        )
    }

    func test_execute_returns_false_when_value_is_small_positive() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenValue: 0.001,
            expectedResult: false
        )
    }
}

// MARK: - Execute Testing

private extension ProgressBarGetIsIndicatorHiddenUseCaseTests {

    func testExecute(
        givenValue: CGFloat,
        expectedResult: Bool
    ) {
        // GIVEN
        let useCase = ProgressBarGetIsIndicatorHiddenUseCase()

        // WHEN
        let result = useCase.execute(value: givenValue)

        // THEN
        XCTAssertEqual(
            result,
            expectedResult,
            "Wrong hidden result for value \(givenValue)"
        )
    }
}
