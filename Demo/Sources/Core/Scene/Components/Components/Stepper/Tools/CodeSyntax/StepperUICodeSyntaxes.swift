//
//  StepperUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct StepperUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Default", code: Self.simple),
            .init(title: "With Formatter", code: Self.withFormatter),
            .init(title: "With Accessibility", code: Self.withAccessibility),
            .init(title: "Full Configuration", code: Self.full)
        ]
    }()

    // MARK: - Private Properties

    private static var simple: String {
        """
        let stepper = SparkUIStepper(theme: theme)
        stepper.value = 0
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.step = 1
        stepper.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var withFormatter: String {
        """
        let stepper = SparkUIStepper(theme: theme)
        stepper.value = 0
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.step = 5

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        formatter.locale = .init(identifier: "fr_FR")
        stepper.valueNumberFormatter = formatter

        stepper.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var withAccessibility: String {
        """
        let stepper = SparkUIStepper(theme: theme)
        stepper.value = 0
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.step = 5

        stepper.contextAccessibilityLabel = "Price"
        stepper.customIncrementAccessibilityLabel = "Increase price"
        stepper.customDecrementAccessibilityLabel = "Decrease price"

        stepper.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var full: String {
        """
        let stepper = SparkUIStepper(theme: theme)
        stepper.value = 0
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.step = 5
        stepper.isContinuous = true
        stepper.autoRepeat = true
        stepper.isEnabled = true

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        formatter.locale = .init(identifier: "fr_FR")
        stepper.valueNumberFormatter = formatter

        stepper.contextAccessibilityLabel = "Price"
        stepper.customIncrementAccessibilityLabel = "Increase price"
        stepper.customDecrementAccessibilityLabel = "Decrease price"

        stepper.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }
}
