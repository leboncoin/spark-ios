//
//  ProgressBarIndeterminateGetAnimationStatusUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentProgressBar

@Suite("Progress Bar Indeterminate Get Animation Status Use Case Tests")
struct ProgressBarIndeterminateGetAnimationStatusUseCaseTests {

    // MARK: - Tests

    @Test("Execute returns start when is animated is true")
    func executeReturnsStartWhenIsAnimatedIsTrue() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIsAnimated: true,
            expectedStatus: .start
        )
    }

    @Test("Execute returns stop when is animated is false")
    func executeReturnsStopWhenIsAnimatedIsFalse() {
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
        #expect(status == expectedStatus, "Wrong status for isAnimated \(givenIsAnimated)")
    }
}