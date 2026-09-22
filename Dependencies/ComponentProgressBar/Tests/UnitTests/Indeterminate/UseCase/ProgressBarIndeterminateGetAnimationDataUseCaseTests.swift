//
//  ProgressBarIndeterminateGetAnimationDataUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentProgressBar

final class ProgressBarIndeterminateGetAnimationDataUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let trackWidth: CGFloat = 100

    // MARK: - Tests

    func test_execute_when_type_is_easeIn() {
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

    func test_execute_when_type_is_easeOut() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .easeOut,
            expectedAnimatedData: .init(
                leadingSpaceWidth: self.trackWidth,
                indicatorWidth: 0
            )
        )
    }

    func test_execute_when_type_is_reset() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .reset,
            expectedAnimatedData: .init(
                leadingSpaceWidth: 0,
                indicatorWidth: 0
            )
        )
    }

    func test_execute_when_type_is_none() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenType: .none,
            expectedAnimatedData: .init(
                leadingSpaceWidth: 0,
                indicatorWidth: 0
            )
        )
    }

    func test_execute_when_type_is_nil() {
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
        XCTAssertEqual(
            animatedData,
            expectedAnimatedData,
            "Wrong animated data for type \(String(describing: givenType))"
        )
    }
}