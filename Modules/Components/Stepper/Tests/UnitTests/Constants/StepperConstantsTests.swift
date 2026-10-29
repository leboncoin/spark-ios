//
//  StepperConstantsTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentStepper

@Suite("Stepper Constants Tests")
struct StepperConstantsTests {

    // MARK: - Tests

    @Test("Global constants")
    func globalConstants() {
        #expect(StepperConstants.textMinWidth == 48)
        #expect(StepperConstants.trackingInterval == 0.5)
    }

    @Test("Icon button constants")
    func iconButtonConstants() {
        #expect(StepperConstants.IconButton.intent == .support)
        #expect(StepperConstants.IconButton.variant == .outlined)
        #expect(StepperConstants.IconButton.size == .medium)
        #expect(StepperConstants.IconButton.shape == .rounded)
    }
}
