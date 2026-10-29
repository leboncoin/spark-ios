//
//  StepperGetAccessibilityLabelUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentStepper

@Suite("Stepper Get Accessibility Label UseCase Tests")
struct StepperGetAccessibilityLabelUseCaseTests {

    // MARK: - Properties

    private let useCase = StepperGetAccessibilityLabelUseCase()

    // MARK: - With Custom Label Tests

    @Test("Execute with custom label with context")
    func executeWithCustomLabelWithContext() {
        // GIVEN
        let customLabel = "Custom Label"

        // WHEN
        let result = self.useCase.execute(for: .increment, context: "Context", customLabel: customLabel)

        // THEN
        #expect(result == customLabel)
    }

    @Test("Execute with custom label without context")
    func executeWithCustomLabelWithoutContext() {
        // GIVEN
        let customLabel = "Custom Label"

        // WHEN
        let result = self.useCase.execute(for: .increment, context: nil, customLabel: customLabel)

        // THEN
        #expect(result == customLabel)
    }

    // MARK: - Without Custom Label Tests

    @Test("Execute without custom label with context for increment")
    func executeWithoutCustomLabelWithContextForIncrement() {
        // GIVEN / WHEN
        let result = self.useCase.execute(for: .increment, context: "Context", customLabel: nil)

        // THEN
        #expect(result == "Context, " + String(localized: "accessibility_label_increment", bundle: .module))
        #expect(result != "Context, " + "accessibility_label_increment")
    }

    @Test("Execute without custom label without context for increment")
    func executeWithoutCustomLabelWithoutContextForIncrement() {
        // GIVEN / WHEN
        let result = self.useCase.execute(for: .increment, context: nil, customLabel: nil)

        // THEN
        #expect(result == String(localized: "accessibility_label_increment", bundle: .module))
        #expect(result != "accessibility_label_increment")
    }

    @Test("Execute without custom label with context for decrement")
    func executeWithoutCustomLabelWithContextForDecrement() {
        // GIVEN / WHEN
        let result = self.useCase.execute(for: .decrement, context: "Context", customLabel: nil)

        // THEN
        #expect(result == "Context, " + String(localized: "accessibility_label_decrement", bundle: .module))
        #expect(result != "Context, " + "accessibility_label_decrement")
    }

    @Test("Execute without custom label without context for decrement")
    func executeWithoutCustomLabelWithoutContextForDecrement() {
        // GIVEN / WHEN
        let result = self.useCase.execute(for: .decrement, context: nil, customLabel: nil)

        // THEN
        #expect(result == String(localized: "accessibility_label_decrement", bundle: .module))
        #expect(result != "accessibility_label_decrement")
    }
}
