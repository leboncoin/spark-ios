//
//  StepperGetAccessibilityLabelUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentStepper

class StepperGetAccessibilityLabelUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = StepperGetAccessibilityLabelUseCase()

    // MARK: - With Custom Label Tests

    func testExecute_withCustomLabel_withContext() {
        // GIVEN
        let customLabel = "Custom Label"

        // WHEN
        let result = self.useCase.execute(for: .increment, context: "Context", customLabel: customLabel)

        // THEN
        XCTAssertEqual(result, customLabel)
    }

    func testExecute_withCustomLabel_withoutContext() {
        // GIVEN
        let customLabel = "Custom Label"

        // WHEN
        let result = self.useCase.execute(for: .increment, context: nil, customLabel: customLabel)

        // THEN
        XCTAssertEqual(result, customLabel)
    }

    // MARK: - Without Custom Label Tests

    func testExecute_withoutCustomLabel_withContext_forIncrement() {
        // GIVEN / WHEN
        let result = self.useCase.execute(for: .increment, context: "Context", customLabel: nil)

        // THEN
        XCTAssertEqual(result, "Context, " + String(localized: "accessibility_label_increment", bundle: .module))
        XCTAssertNotEqual(result, "Context, " + "accessibility_label_increment")
    }

    func testExecute_withoutCustomLabel_withoutContext_forIncrement() {
        // GIVEN / WHEN
        let result = self.useCase.execute(for: .increment, context: nil, customLabel: nil)

        // THEN
        XCTAssertEqual(result, String(localized: "accessibility_label_increment", bundle: .module))
        XCTAssertNotEqual(result, "accessibility_label_increment")
    }

    func testExecute_withoutCustomLabelWithContext_forDecrement() {
        // GIVEN / WHEN
        let result = self.useCase.execute(for: .decrement, context: "Context", customLabel: nil)

        // THEN
        XCTAssertEqual(result, "Context, " + String(localized: "accessibility_label_decrement", bundle: .module))
        XCTAssertNotEqual(result, "Context, " + "accessibility_label_decrement")
    }

    func testExecute_withoutCustomLabel_withoutContext_forDecrement() {
        // GIVEN / WHEN
        let result = self.useCase.execute(for: .decrement, context: nil, customLabel: nil)

        // THEN
        XCTAssertEqual(result, String(localized: "accessibility_label_decrement", bundle: .module))
        XCTAssertNotEqual(result, "accessibility_label_decrement")
    }
}
