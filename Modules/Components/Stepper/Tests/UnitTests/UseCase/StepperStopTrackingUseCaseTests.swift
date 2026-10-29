//
//  StepperStopTrackingUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentStepper

@Suite("Stepper Stop Tracking UseCase Tests")
struct StepperStopTrackingUseCaseTests {

    // MARK: - Properties

    private let useCase = StepperStopTrackingUseCase()

    // MARK: - Tests

    @Test("Execute")
    func execute() {
        // GIVEN
        var isTracking = true
        var task: Task<Void, Never>? = Task { }
        var trackingInterval: TimeInterval = 2.0

        // WHEN
        self.useCase.execute(isTracking: &isTracking, task: &task, trackingInterval: &trackingInterval)

        // THEN
        #expect(!isTracking)
        #expect(task == nil)
        #expect(trackingInterval == StepperConstants.trackingInterval)
    }
}
