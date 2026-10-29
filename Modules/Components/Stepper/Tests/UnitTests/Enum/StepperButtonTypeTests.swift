//
//  StepperButtonTypeTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentStepper

@Suite("Stepper Button Type Tests")
struct StepperButtonTypeTests {

    // MARK: - Tests

    @Test("Accessibility identifier for decrement case")
    func accessibilityIdentifierForDecrementCase() {
        #expect(
            StepperButtonType.decrement.accessibilityIdentifer == StepperAccessibilityIdentifier.decrementButton
        )
    }

    @Test("Accessibility identifier for increment case")
    func accessibilityIdentifierForIncrementCase() {
        #expect(
            StepperButtonType.increment.accessibilityIdentifer == StepperAccessibilityIdentifier.incrementButton
        )
    }
}
