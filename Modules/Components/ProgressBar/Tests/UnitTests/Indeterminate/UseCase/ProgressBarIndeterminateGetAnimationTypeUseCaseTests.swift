//
//  ProgressBarIndeterminateGetAnimationTypeUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentProgressBar

@Suite("Progress Bar Indeterminate Get Animation Type Use Case Tests")
struct ProgressBarIndeterminateGetAnimationTypeUseCaseTests {

    // MARK: - Execute Tests

    @Test("Execute returns ease in when is animated is true")
    func executeReturnsEaseInWhenIsAnimatedIsTrue() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIsAnimated: true,
            expectedType: .easeIn
        )
    }

    @Test("Execute returns none when is animated is false")
    func executeReturnsNoneWhenIsAnimatedIsFalse() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIsAnimated: false,
            expectedType: .none
        )
    }

    // MARK: - Execute Next Tests

    @Test("Execute next returns ease out when type is ease in")
    func executeNextReturnsEaseOutWhenTypeIsEaseIn() {
        // GIVEN / WHEN / THEN
        self.testExecuteNext(
            givenType: .easeIn,
            expectedNextType: .easeOut
        )
    }

    @Test("Execute next returns reset when type is ease out")
    func executeNextReturnsResetWhenTypeIsEaseOut() {
        // GIVEN / WHEN / THEN
        self.testExecuteNext(
            givenType: .easeOut,
            expectedNextType: .reset
        )
    }

    @Test("Execute next returns ease in when type is reset")
    func executeNextReturnsEaseInWhenTypeIsReset() {
        // GIVEN / WHEN / THEN
        self.testExecuteNext(
            givenType: .reset,
            expectedNextType: .easeIn
        )
    }

    @Test("Execute next returns nil when type is none")
    func executeNextReturnsNilWhenTypeIsNone() {
        // GIVEN / WHEN / THEN
        self.testExecuteNext(
            givenType: .none,
            expectedNextType: nil
        )
    }

    @Test("Execute next returns nil when type is nil")
    func executeNextReturnsNilWhenTypeIsNil() {
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
        #expect(type == expectedType, "Wrong type for isAnimated \(givenIsAnimated)")
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
        #expect(nextType == expectedNextType, "Wrong next type for type \(String(describing: givenType))")
    }
}
