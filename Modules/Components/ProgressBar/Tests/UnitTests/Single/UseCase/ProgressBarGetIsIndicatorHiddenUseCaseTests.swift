//
//  ProgressBarGetIsIndicatorHiddenUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentProgressBar

@Suite("Progress Bar Get Is Indicator Hidden Use Case Tests")
struct ProgressBarGetIsIndicatorHiddenUseCaseTests {

    // MARK: - Tests

    @Test("Execute returns true when value is zero")
    func executeReturnsTrueWhenValueIsZero() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenValue: 0.0,
            expectedResult: true
        )
    }

    @Test("Execute returns false when value is one")
    func executeReturnsFalseWhenValueIsOne() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenValue: 1.0,
            expectedResult: false
        )
    }

    @Test("Execute returns false when value is in positive range")
    func executeReturnsFalseWhenValueIsInPositiveRange() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenValue: 0.5,
            expectedResult: false
        )
    }

    @Test("Execute returns true when value is negative")
    func executeReturnsTrueWhenValueIsNegative() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenValue: -0.1,
            expectedResult: true
        )
    }

    @Test("Execute returns false when value is greater than one")
    func executeReturnsFalseWhenValueIsGreaterThanOne() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenValue: 1.1,
            expectedResult: false
        )
    }

    @Test("Execute returns false when value is small positive")
    func executeReturnsFalseWhenValueIsSmallPositive() {
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
        #expect(result == expectedResult, "Wrong hidden result for value \(givenValue)")
    }
}
