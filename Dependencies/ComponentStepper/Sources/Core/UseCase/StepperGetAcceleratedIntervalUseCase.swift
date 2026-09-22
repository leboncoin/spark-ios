//
//  StepperGetAcceleratedIntervalUseCase.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Protocol

protocol StepperGetAcceleratedIntervalUseCaseable {
    func execute(from interval: TimeInterval) -> TimeInterval
}

// MARK: - Implementation

struct StepperGetAcceleratedIntervalUseCase: StepperGetAcceleratedIntervalUseCaseable {

    // MARK: - Execute

    func execute(from interval: TimeInterval) -> TimeInterval {
        return max(0.035, interval * 0.85)
    }
}
