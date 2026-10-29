//
//  StepperGetOpacityUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentStepper
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Stepper Get Opacity UseCase Tests")
struct StepperGetOpacityUseCaseTests {

    // MARK: - Properties

    private let useCase = StepperGetOpacityUseCase()
    private let dimsMock = DimsGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute when disabled returns dim3")
    func executeWhenDisabledReturnsDim3() {
        // GIVEN
        let isDisabled = true

        // WHEN
        let result = self.useCase.execute(dims: self.dimsMock, isDisabled: isDisabled)

        // THEN
        #expect(result == self.dimsMock.dim3)
    }

    @Test("Execute when enabled returns none")
    func executeWhenEnabledReturnsNone() {
        // GIVEN
        let isDisabled = false

        // WHEN
        let result = self.useCase.execute(dims: self.dimsMock, isDisabled: isDisabled)

        // THEN
        #expect(result == self.dimsMock.none)
    }
}
