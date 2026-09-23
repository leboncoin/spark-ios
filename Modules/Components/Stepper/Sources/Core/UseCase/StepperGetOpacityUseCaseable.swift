//
//  StepperGetOpacityUseCase.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Protocol

protocol StepperGetOpacityUseCaseable {
    func execute(dims: any Dims, isDisabled: Bool) -> CGFloat
}

// MARK: - Implementation

struct StepperGetOpacityUseCase: StepperGetOpacityUseCaseable {

    func execute(dims: any Dims, isDisabled: Bool) -> CGFloat {
        return isDisabled ? dims.dim3 : dims.none
    }
}
