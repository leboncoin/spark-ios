//
//  StepperGetIsDisabledUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentStepper

@Suite("Stepper Get Is Disabled UseCase Tests")
struct StepperGetIsDisabledUseCaseTests {

    // MARK: - Properties

    private let useCase = StepperGetIsDisabledUseCase()

    // MARK: - Tests

    @Test("Decrement button when value at lower bound")
    func decrementButtonWhenValueAtLowerBound() {
        let result = self.useCase.execute(for: .decrement, value: 0, bounds: 0...10, componentIsDisabled: false)
        #expect(result)
    }

    @Test("Decrement button when value above lower bound")
    func decrementButtonWhenValueAboveLowerBound() {
        let result = self.useCase.execute(for: .decrement, value: 5, bounds: 0...10, componentIsDisabled: false)
        #expect(!result)
    }

    @Test("Increment button when value at upper bound")
    func incrementButtonWhenValueAtUpperBound() {
        let result = self.useCase.execute(for: .increment, value: 10, bounds: 0...10, componentIsDisabled: false)
        #expect(result)
    }

    @Test("Increment button enabled when value below upper bound")
    func incrementButtonEnabledWhenValueBelowUpperBound() {
        let result = self.useCase.execute(for: .increment, value: 5, bounds: 0...10, componentIsDisabled: false)
        #expect(!result)
    }

    @Test("Both buttons when component is disabled")
    func bothButtonsWhenComponentIsDisabled() {
        let decrementResult = self.useCase.execute(for: .decrement, value: 5, bounds: 0...10, componentIsDisabled: true)
        let incrementResult = self.useCase.execute(for: .increment, value: 5, bounds: 0...10, componentIsDisabled: true)
        #expect(!decrementResult)
        #expect(!incrementResult)
    }
}
