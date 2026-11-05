//
//  ProgressBarIndeterminateGetIndicatorOpacityUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentProgressBar

@Suite("Progress Bar Indeterminate Get Indicator Opacity Use Case Tests")
struct ProgressBarIndeterminateGetIndicatorOpacityUseCaseTests {

    // MARK: - Tests

    @Test("Execute returns zero when type is none")
    func executeReturnsZeroWhenTypeIsNone() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .none,
            expectedOpacity: 0
        )
    }

    @Test("Execute returns one when type is ease in")
    func executeReturnsOneWhenTypeIsEaseIn() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .easeIn,
            expectedOpacity: 1
        )
    }

    @Test("Execute returns one when type is ease out")
    func executeReturnsOneWhenTypeIsEaseOut() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .easeOut,
            expectedOpacity: 1
        )
    }

    @Test("Execute returns one when type is reset")
    func executeReturnsOneWhenTypeIsReset() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .reset,
            expectedOpacity: 1
        )
    }

    @Test("Execute returns zero when type is nil")
    func executeReturnsZeroWhenTypeIsNil() {
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
        #expect(opacity == expectedOpacity, "Wrong opacity for type \(String(describing: givenType))")
    }
}