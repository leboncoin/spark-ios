//
//  StepperButtonType.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

enum StepperButtonType: CaseIterable {
    case decrement
    case increment

    // MARK: - Properties

    var accessibilityIdentifer: String {
        return switch self {
        case .decrement: StepperAccessibilityIdentifier.decrementButton
        case .increment: StepperAccessibilityIdentifier.incrementButton
        }
    }
}
