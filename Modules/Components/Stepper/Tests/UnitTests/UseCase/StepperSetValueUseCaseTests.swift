//
//  StepperSetValueUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentStepper

@Suite("Stepper Set Value UseCase Tests")
struct StepperSetValueUseCaseTests {

    // MARK: - Properties

    private let useCase = StepperSetValueUseCase()

    // MARK: - Tests

    @Test("Execute decrement")
    func executeDecrement() {
        // GIVEN
        let type: StepperButtonType = .decrement
        let value = 5
        let step = 1
        let bounds = 0...10

        // WHEN
        let result = self.useCase.execute(for: type, value: value, step: step, bounds: bounds)

        // THEN
        #expect(result == 4)
    }

    @Test("Execute increment")
    func executeIncrement() {
        // GIVEN
        let type: StepperButtonType = .increment
        let value = 5
        let step = 1
        let bounds = 0...10

        // WHEN
        let result = self.useCase.execute(for: type, value: value, step: step, bounds: bounds)

        // THEN
        #expect(result == 6)
    }

    @Test("Execute decrement at lower bound")
    func executeDecrementAtLowerBound() {
        // GIVEN
        let type: StepperButtonType = .decrement
        let value = 0
        let step = 1
        let bounds = 0...10

        // WHEN
        let result = self.useCase.execute(for: type, value: value, step: step, bounds: bounds)

        // THEN
        #expect(result == 0)
    }

    @Test("Execute increment at upper bound")
    func executeIncrementAtUpperBound() {
        // GIVEN
        let type: StepperButtonType = .increment
        let value = 10
        let step = 1
        let bounds = 0...10

        // WHEN
        let result = self.useCase.execute(for: type, value: value, step: step, bounds: bounds)

        // THEN
        #expect(result == 10)
    }

    @Test("Execute with larger step")
    func executeWithLargerStep() {
        // GIVEN
        let type: StepperButtonType = .increment
        let value = 5
        let step = 3
        let bounds = 0...10

        // WHEN
        let result = self.useCase.execute(for: type, value: value, step: step, bounds: bounds)

        // THEN
        #expect(result == 8)
    }
}
