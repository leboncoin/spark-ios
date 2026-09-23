//
//  StepperGetIsDisabledUseCase.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Protocol

protocol StepperGetIsDisabledUseCaseable {
    func execute<V>(
        for type: StepperButtonType,
        value: V,
        bounds: ClosedRange<V>,
        componentIsDisabled: Bool
    ) -> Bool where V: Strideable
}

// MARK: - Implementation

struct StepperGetIsDisabledUseCase: StepperGetIsDisabledUseCaseable {

    func execute<V>(
        for type: StepperButtonType,
        value: V,
        bounds: ClosedRange<V>,
        componentIsDisabled: Bool
    ) -> Bool where V: Strideable {
        guard !componentIsDisabled else {
            return false
        }

        return switch type {
        case .decrement: value <= bounds.lowerBound
        case .increment: value >= bounds.upperBound
        }
    }
}
