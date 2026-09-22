//
//  StepperGetHorizontalSpacingUseCase.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Protocol

protocol StepperGetHorizontalSpacingUseCaseable {
    func execute(spacing: any LayoutSpacing) -> CGFloat
}

// MARK: - Implementation

struct StepperGetHorizontalSpacingUseCase: StepperGetHorizontalSpacingUseCaseable {

    func execute(spacing: any LayoutSpacing) -> CGFloat {
        spacing.medium
    }
}
