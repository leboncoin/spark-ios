//
//  ProgressBarIndeterminateGetAnimationDataUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentProgressBar

@Suite("Progress Bar Indeterminate Get Animation Data Use Case Tests")
struct ProgressBarIndeterminateGetAnimationDataUseCaseTests {

    // MARK: - Properties

    private let trackWidth: CGFloat = 100

    // MARK: - Tests

    @Test("Execute when type is ease in")
    func executeWhenTypeIsEaseIn() {
        // GIVEN / WHEN / THEN
        let indicatorMaxWidth = self.trackWidth * ProgressBarIndeterminateConstants.Animation.maxWidthRatio
        self.testExecute(
            givenType: .easeIn,
            expectedAnimatedData: .init(
                leadingSpaceWidth: (self.trackWidth - indicatorMaxWidth) / 2,
                indicatorWidth: indicatorMaxWidth
            )
        )
    }

    @Test("Execute when type is ease out")
    func executeWhenTypeIsEaseOut() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .easeOut,
            expectedAnimatedData: .init(
                leadingSpaceWidth: self.trackWidth,
                indicatorWidth: 0
            )
        )
    }

    @Test("Execute when type is reset")
    func executeWhenTypeIsReset() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .reset,
            expectedAnimatedData: .init(
                leadingSpaceWidth: 0,
                indicatorWidth: 0
            )
        )
    }

    @Test("Execute when type is none")
    func executeWhenTypeIsNone() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .none,
            expectedAnimatedData: .init(
                leadingSpaceWidth: 0,
                indicatorWidth: 0
            )
        )
    }

    @Test("Execute when type is nil")
    func executeWhenTypeIsNil() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: nil,
            expectedAnimatedData: .init(
                leadingSpaceWidth: 0,
                indicatorWidth: 0
            )
        )
    }
}

// MARK: - Execute Testing

private extension ProgressBarIndeterminateGetAnimationDataUseCaseTests {

    func testExecute(
        givenType: ProgressBarIndeterminateAnimationType?,
        expectedAnimatedData: ProgressBarIndeterminateAnimatedData
    ) {
        // GIVEN
        let useCase = ProgressBarIndeterminateGetAnimationDataUseCase()

        // WHEN
        let animatedData = useCase.execute(
            type: givenType,
            trackWidth: self.trackWidth
        )

        // THEN
        #expect(animatedData == expectedAnimatedData, "Wrong animated data for type \(String(describing: givenType))")
    }
}