//
//  StepperStopTrackingUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentStepper

class StepperStopTrackingUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = StepperStopTrackingUseCase()

    // MARK: - Tests

    func testExecute() {
        // GIVEN
        var isTracking = true
        var task: Task<Void, Never>? = Task { }
        var trackingInterval: TimeInterval = 2.0

        // WHEN
        self.useCase.execute(isTracking: &isTracking, task: &task, trackingInterval: &trackingInterval)

        // THEN
        XCTAssertFalse(isTracking)
        XCTAssertNil(task)
        XCTAssertEqual(trackingInterval, StepperConstants.trackingInterval)
    }
}
