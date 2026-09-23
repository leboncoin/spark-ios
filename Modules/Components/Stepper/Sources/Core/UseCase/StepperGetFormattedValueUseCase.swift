//
//  StepperGetFormattedValueUseCase.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Protocol

protocol StepperGetFormattedValueUseCaseable {
    func execute<V>(value: V, formatter: NumberFormatter) -> String
}

// MARK: - Implementation

struct StepperGetFormattedValueUseCase: StepperGetFormattedValueUseCaseable {

    func execute<V>(value: V, formatter: NumberFormatter) -> String {
        return formatter.string(for: value) ?? "\(value)"
    }
}
