//
//  StepperGetAcceleratedIntervalUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentStepper

class StepperGetAcceleratedIntervalUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = StepperGetAcceleratedIntervalUseCase()

    // MARK: - Tests

    func testExecuteWithNormalValue() {
        XCTAssertEqual(self.useCase.execute(from: 1.0), 0.85, accuracy: 0.001)
    }

    func testExecuteWithLowerValue() {
        XCTAssertEqual(self.useCase.execute(from: 0.01), 0.035, accuracy: 0.001)
    }

    func testExecuteWithBigValue() {
        XCTAssertEqual(self.useCase.execute(from: 10.0), 8.5, accuracy: 0.001)
    }
}
