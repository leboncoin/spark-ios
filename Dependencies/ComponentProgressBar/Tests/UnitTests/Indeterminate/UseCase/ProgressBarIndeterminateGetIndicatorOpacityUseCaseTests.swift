//
//  ProgressBarIndeterminateGetIndicatorOpacityUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentProgressBar

final class ProgressBarIndeterminateGetIndicatorOpacityUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_returns_zero_when_type_is_none() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .none,
            expectedOpacity: 0
        )
    }

    func test_execute_returns_one_when_type_is_easeIn() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .easeIn,
            expectedOpacity: 1
        )
    }

    func test_execute_returns_one_when_type_is_easeOut() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .easeOut,
            expectedOpacity: 1
        )
    }

    func test_execute_returns_one_when_type_is_reset() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .reset,
            expectedOpacity: 1
        )
    }

    func test_execute_returns_zero_when_type_is_nil() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: nil,
            expectedOpacity: 0
        )
    }
}

// MARK: - Execute Testing

private extension ProgressBarIndeterminateGetIndicatorOpacityUseCaseTests {

    func testExecute(
        givenType: ProgressBarIndeterminateAnimationType?,
        expectedOpacity: CGFloat
    ) {
        // GIVEN
        let useCase = ProgressBarIndeterminateGetIndicatorOpacityUseCase()

        // WHEN
        let opacity = useCase.execute(type: givenType)

        // THEN
        XCTAssertEqual(
            opacity,
            expectedOpacity,
            "Wrong opacity for type \(String(describing: givenType))"
        )
    }
}