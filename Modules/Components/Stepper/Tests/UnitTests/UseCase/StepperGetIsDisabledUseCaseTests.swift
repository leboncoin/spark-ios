//
//  StepperGetIsDisabledUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentStepper

class StepperGetIsDisabledUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = StepperGetIsDisabledUseCase()

    // MARK: - Tests

    func testDecrementButtonWhenValueAtLowerBound() {
        let result = self.useCase.execute(for: .decrement, value: 0, bounds: 0...10, componentIsDisabled: false)
        XCTAssertTrue(result)
    }

    func testDecrementButtonWhenValueAboveLowerBound() {
        let result = self.useCase.execute(for: .decrement, value: 5, bounds: 0...10, componentIsDisabled: false)
        XCTAssertFalse(result)
    }

    func testIncrementButtonWhenValueAtUpperBound() {
        let result = self.useCase.execute(for: .increment, value: 10, bounds: 0...10, componentIsDisabled: false)
        XCTAssertTrue(result)
    }

    func testIncrementButtonEnabledWhenValueBelowUpperBound() {
        let result = self.useCase.execute(for: .increment, value: 5, bounds: 0...10, componentIsDisabled: false)
        XCTAssertFalse(result)
    }

    func testBothButtonsWhenComponentIsDisabled() {
        let decrementResult = self.useCase.execute(for: .decrement, value: 5, bounds: 0...10, componentIsDisabled: true)
        let incrementResult = self.useCase.execute(for: .increment, value: 5, bounds: 0...10, componentIsDisabled: true)
        XCTAssertFalse(decrementResult)
        XCTAssertFalse(incrementResult)
    }
}
