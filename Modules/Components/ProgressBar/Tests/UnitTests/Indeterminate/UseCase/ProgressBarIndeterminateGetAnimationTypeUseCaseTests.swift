//
//  ProgressBarIndeterminateGetAnimationTypeUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentProgressBar

final class ProgressBarIndeterminateGetAnimationTypeUseCaseTests: XCTestCase {

    // MARK: - Execute Tests

    func test_execute_returns_easeIn_when_isAnimated_is_true() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIsAnimated: true,
            expectedType: .easeIn
        )
    }

    func test_execute_returns_none_when_isAnimated_is_false() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIsAnimated: false,
            expectedType: .none
        )
    }

    // MARK: - Execute Next Tests

    func test_executeNext_returns_easeOut_when_type_is_easeIn() {
        // GIVEN / WHEN / THEN
        self.testExecuteNext(
            givenType: .easeIn,
            expectedNextType: .easeOut
        )
    }

    func test_executeNext_returns_reset_when_type_is_easeOut() {
        // GIVEN / WHEN / THEN
        self.testExecuteNext(
            givenType: .easeOut,
            expectedNextType: .reset
        )
    }

    func test_executeNext_returns_easeIn_when_type_is_reset() {
        // GIVEN / WHEN / THEN
        self.testExecuteNext(
            givenType: .reset,
            expectedNextType: .easeIn
        )
    }

    func test_executeNext_returns_nil_when_type_is_none() {
        // GIVEN / WHEN / THEN
        self.testExecuteNext(
            givenType: .none,
            expectedNextType: nil
        )
    }

    func test_executeNext_returns_nil_when_type_is_nil() {
        // GIVEN / WHEN / THEN
        self.testExecuteNext(
            givenType: nil,
            expectedNextType: nil
        )
    }
}

// MARK: - Execute Testing

private extension ProgressBarIndeterminateGetAnimationTypeUseCaseTests {

    func testExecute(
        givenIsAnimated: Bool,
        expectedType: ProgressBarIndeterminateAnimationType?
    ) {
        // GIVEN
        let useCase = ProgressBarIndeterminateGetAnimationTypeUseCase()

        // WHEN
        let type = useCase.execute(isAnimated: givenIsAnimated)

        // THEN
        XCTAssertEqual(
            type,
            expectedType,
            "Wrong type for isAnimated \(givenIsAnimated)"
        )
    }

    func testExecuteNext(
        givenType: ProgressBarIndeterminateAnimationType?,
        expectedNextType: ProgressBarIndeterminateAnimationType?
    ) {
        // GIVEN
        let useCase = ProgressBarIndeterminateGetAnimationTypeUseCase()

        // WHEN
        let nextType = useCase.executeNext(type: givenType)

        // THEN
        XCTAssertEqual(
            nextType,
            expectedNextType,
            "Wrong next type for type \(String(describing: givenType))"
        )
    }
}
