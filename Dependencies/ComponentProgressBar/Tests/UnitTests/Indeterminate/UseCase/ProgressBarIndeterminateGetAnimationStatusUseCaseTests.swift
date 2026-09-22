//
//  ProgressBarIndeterminateGetAnimationStatusUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentProgressBar

final class ProgressBarIndeterminateGetAnimationStatusUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_returns_start_when_isAnimated_is_true() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIsAnimated: true,
            expectedStatus: .start
        )
    }

    func test_execute_returns_stop_when_isAnimated_is_false() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIsAnimated: false,
            expectedStatus: .stop
        )
    }
}

// MARK: - Execute Testing

private extension ProgressBarIndeterminateGetAnimationStatusUseCaseTests {

    func testExecute(
        givenIsAnimated: Bool,
        expectedStatus: ProgressBarIndeterminateStatus
    ) {
        // GIVEN
        let useCase = ProgressBarIndeterminateGetAnimationStatusUseCase()

        // WHEN
        let status = useCase.execute(isAnimated: givenIsAnimated)

        // THEN
        XCTAssertEqual(
            status,
            expectedStatus,
            "Wrong status for isAnimated \(givenIsAnimated)"
        )
    }
}