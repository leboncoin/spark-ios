//
//  StepperStopTrackingUseCase.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Protocol

protocol StepperStopTrackingUseCaseable {
    func execute(isTracking: inout Bool, task: inout Task<Void, Never>?, trackingInterval: inout TimeInterval)
}

// MARK: - Implementation

struct StepperStopTrackingUseCase: StepperStopTrackingUseCaseable {

    func execute(
        isTracking: inout Bool,
        task: inout Task<Void, Never>?,
        trackingInterval: inout TimeInterval
    ) {
        isTracking = false
        task?.cancel()
        task = nil
        trackingInterval = StepperConstants.trackingInterval
    }
}
