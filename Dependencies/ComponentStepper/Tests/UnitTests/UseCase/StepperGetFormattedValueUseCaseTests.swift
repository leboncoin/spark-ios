//
//  StepperGetFormattedValueUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentStepper

class StepperGetFormattedValueUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = StepperGetFormattedValueUseCase()

    // MARK: - Tests

    func testExecuteWithInteger() {
        // GIVEN
        let value = 42

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        // WHEN
        let result = self.useCase.execute(value: value, formatter: formatter)

        // THEN
        XCTAssertEqual(result, "42")
    }

    func testExecuteWithDouble() {
        // GIVEN
        let value = 3.14

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale(identifier: "en_US")

        // WHEN
        let result = self.useCase.execute(value: value, formatter: formatter)

        // THEN
        XCTAssertEqual(result, "3.14")
    }

    func testExecuteWithCurrency() {
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
        XCTAssertEqual(result, "0,99 €")
    }

    func testExecuteWithNil() {
        // GIVEN
        let value: Int? = nil

        let formatter = NumberFormatter()

        // WHEN
        let result = self.useCase.execute(value: value, formatter: formatter)

        // THEN
        XCTAssertEqual(result, "nil")
    }
}
