//
//  FormFieldGetTitleAccessibilityLabelUseCase.swift
//  SparkComponentFormField
//
//  Created by robin.lemaire on 07/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Protocol

// sourcery: AutoMockable
protocol FormFieldGetTitleAccessibilityLabelUseCaseable {
    func execute(title: String?, customValue: String?, isRequired: Bool) -> String?
}

// MARK: - Implementation

struct FormFieldGetTitleAccessibilityLabelUseCase: FormFieldGetTitleAccessibilityLabelUseCaseable {

    // MARK: - Class

    private final class Class {}

    // MARK: - Private Properties

    private var requireString: String {
        return ", " + String(localized: "accessibility_label_title_require", bundle: .current)
    }

    // MARK: - Execute

    func execute(title: String?, customValue: String?, isRequired: Bool) -> String? {
        guard isRequired else {
            return customValue ?? title
        }

        return switch (title, customValue) {
        case (_, let customValue?): customValue + self.requireString
        case (let title?, nil): title + self.requireString
        default: nil
        }
    }
}
