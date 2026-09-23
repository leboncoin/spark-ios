//
//  StepperSetValueUseCase.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Protocol

protocol StepperSetValueUseCaseable {
    func execute<V>(for type: StepperButtonType, value: V, step: V.Stride, bounds: ClosedRange<V>) -> V where V: Strideable
}

// MARK: - Implementation

struct StepperSetValueUseCase: StepperSetValueUseCaseable {

    func execute<V>(
        for type: StepperButtonType,
        value: V,
        step: V.Stride,
        bounds: ClosedRange<V>
    ) -> V where V: Strideable {
        return switch type {
        case .decrement: max(bounds.lowerBound, value.advanced(by: -step))
        case .increment: min(bounds.upperBound, value.advanced(by: step))
        }
    }
}
