//
//  StepperGetHorizontalSpacingUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentStepper
@_spi(SI_SPI) import SparkThemingTesting

class StepperGetHorizontalSpacingUseCaseTests: XCTestCase {

    // MARK: - Tests

    func testExecute() {
        // GIVEN
        let useCase = StepperGetHorizontalSpacingUseCase()

        let spacingMock = LayoutSpacingGeneratedMock.mocked()

        // WHEN
        let result = useCase.execute(spacing: spacingMock)

        // THEN
        XCTAssertEqual(result, spacingMock.medium)
    }
}
