//
//  StepperGetHorizontalSpacingUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentStepper
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Stepper Get Horizontal Spacing UseCase Tests")
struct StepperGetHorizontalSpacingUseCaseTests {

    // MARK: - Tests

    @Test("Execute")
    func execute() {
        // GIVEN
        let useCase = StepperGetHorizontalSpacingUseCase()

        let spacingMock = LayoutSpacingGeneratedMock.mocked()

        // WHEN
        let result = useCase.execute(spacing: spacingMock)

        // THEN
        #expect(result == spacingMock.medium)
    }
}
