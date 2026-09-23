//
//  StepperGetOpacityUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentStepper
@_spi(SI_SPI) import SparkThemingTesting

class StepperGetOpacityUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = StepperGetOpacityUseCase()
    private let dimsMock = DimsGeneratedMock.mocked()

    // MARK: - Tests

    func testExecuteWhenDisabledReturnsDim3() {
        // GIVEN
        let isDisabled = true

        // WHEN
        let result = self.useCase.execute(dims: self.dimsMock, isDisabled: isDisabled)

        // THEN
        XCTAssertEqual(result, self.dimsMock.dim3)
    }

    func testExecuteWhenEnabledReturnsNone() {
        // GIVEN
        let isDisabled = false

        // WHEN
        let result = self.useCase.execute(dims: self.dimsMock, isDisabled: isDisabled)

        // THEN
        XCTAssertEqual(result, self.dimsMock.none)
    }
}
