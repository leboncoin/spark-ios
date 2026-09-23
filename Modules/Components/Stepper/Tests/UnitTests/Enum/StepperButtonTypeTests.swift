//
//  StepperButtonTypeTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentStepper

class StepperButtonTypeTests: XCTestCase {

    // MARK: - Tests

    func testAccessibilityIdentifierForDecrementCase() {
        XCTAssertEqual(
            StepperButtonType.decrement.accessibilityIdentifer,
            StepperAccessibilityIdentifier.decrementButton
        )
    }

    func testAccessibilityIdentifierForIncrementCase() {
        XCTAssertEqual(
            StepperButtonType.increment.accessibilityIdentifer,
            StepperAccessibilityIdentifier.incrementButton
        )
    }
}
