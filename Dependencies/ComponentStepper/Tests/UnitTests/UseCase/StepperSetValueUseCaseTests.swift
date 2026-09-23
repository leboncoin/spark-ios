//
//  StepperSetValueUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentStepper

class StepperSetValueUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = StepperSetValueUseCase()

    // MARK: - Tests

    func testExecuteDecrement() {
        // GIVEN
        let type: StepperButtonType = .decrement
        let value = 5
        let step = 1
        let bounds = 0...10

        // WHEN
        let result = self.useCase.execute(for: type, value: value, step: step, bounds: bounds)

        // THEN
        XCTAssertEqual(result, 4)
    }

    func testExecuteIncrement() {
        // GIVEN
        let type: StepperButtonType = .increment
        let value = 5
        let step = 1
        let bounds = 0...10

        // WHEN
        let result = self.useCase.execute(for: type, value: value, step: step, bounds: bounds)

        // THEN
        XCTAssertEqual(result, 6)
    }

    func testExecuteDecrementAtLowerBound() {
        // GIVEN
        let type: StepperButtonType = .decrement
        let value = 0
        let step = 1
        let bounds = 0...10

        // WHEN
        let result = self.useCase.execute(for: type, value: value, step: step, bounds: bounds)

        // THEN
        XCTAssertEqual(result, 0)
    }

    func testExecuteIncrementAtUpperBound() {
        // GIVEN
        let type: StepperButtonType = .increment
        let value = 10
        let step = 1
        let bounds = 0...10

        // WHEN
        let result = self.useCase.execute(for: type, value: value, step: step, bounds: bounds)

        // THEN
        XCTAssertEqual(result, 10)
    }

    func testExecuteWithLargerStep() {
        // GIVEN
        let type: StepperButtonType = .increment
        let value = 5
        let step = 3
        let bounds = 0...10

        // WHEN
        let result = self.useCase.execute(for: type, value: value, step: step, bounds: bounds)

        // THEN
        XCTAssertEqual(result, 8)
    }
}
