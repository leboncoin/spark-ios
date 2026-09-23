//
//  StepperGetAccessibilityLabelUseCase.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Protocol

protocol StepperGetAccessibilityLabelUseCaseable {
    func execute(for type: StepperButtonType, context: String?, customLabel: String?) -> String
}

// MARK: - Implementation

struct StepperGetAccessibilityLabelUseCase: StepperGetAccessibilityLabelUseCaseable {

    // MARK: - Class

    private final class Class {}

    // MARK: - Execute

    func execute(
        for type: StepperButtonType,
        context: String?,
        customLabel: String?
    ) -> String {
        if let customLabel {
            return customLabel
        } else {
            let prefix = if let context {
                context + ", "
            } else {
                ""
            }

            let localizedKey = self.execute(for: type)
            return prefix + String(localized: localizedKey, bundle: .current)
        }
    }

    private func execute(for type: StepperButtonType) -> String.LocalizationValue {
        switch type {
        case .decrement:
            "accessibility_label_decrement"
        case .increment:
            "accessibility_label_increment"
        }
    }
}
