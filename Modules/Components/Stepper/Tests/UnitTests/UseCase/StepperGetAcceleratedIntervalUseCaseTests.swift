//
//  StepperGetAcceleratedIntervalUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentStepper

@Suite("Stepper Get Accelerated Interval UseCase Tests")
struct StepperGetAcceleratedIntervalUseCaseTests {

    // MARK: - Properties

    private let useCase = StepperGetAcceleratedIntervalUseCase()

    // MARK: - Tests

    @Test("Execute with normal value")
    func executeWithNormalValue() {
        #expect(abs(self.useCase.execute(from: 1.0) - 0.85) < 0.001)
    }

    @Test("Execute with lower value")
    func executeWithLowerValue() {
        #expect(abs(self.useCase.execute(from: 0.01) - 0.035) < 0.001)
    }

    @Test("Execute with big value")
    func executeWithBigValue() {
        #expect(abs(self.useCase.execute(from: 10.0) - 8.5) < 0.001)
    }
}
