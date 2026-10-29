//
//  StepperGetFormattedValueUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentStepper

@Suite("Stepper Get Formatted Value UseCase Tests")
struct StepperGetFormattedValueUseCaseTests {

    // MARK: - Properties

    private let useCase = StepperGetFormattedValueUseCase()

    // MARK: - Tests

    @Test("Execute with integer")
    func executeWithInteger() {
        // GIVEN
        let value = 42

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        // WHEN
        let result = self.useCase.execute(value: value, formatter: formatter)

        // THEN
        #expect(result == "42")
    }

    @Test("Execute with double")
    func executeWithDouble() {
        // GIVEN
        let value = 3.14

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale(identifier: "en_US")

        // WHEN
        let result = self.useCase.execute(value: value, formatter: formatter)

        // THEN
        #expect(result == "3.14")
    }

    @Test("Execute with currency")
    func executeWithCurrency() {
        // GIVEN
        let value = 0.99

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.maximumFractionDigits = 2

        // WHEN
        let result = self.useCase.execute(value: value, formatter: formatter)

        // THEN
        #expect(result == "0,99 €")
    }

    @Test("Execute with nil")
    func executeWithNil() {
        // GIVEN
        let value: Int? = nil

        let formatter = NumberFormatter()

        // WHEN
        let result = self.useCase.execute(value: value, formatter: formatter)

        // THEN
        #expect(result == "nil")
    }
}
