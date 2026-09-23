//
//  StepperConstantsTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentStepper

class StepperConstantsTests: XCTestCase {

    // MARK: - Tests

    func testGlobalConstants() {
        XCTAssertEqual(StepperConstants.textMinWidth, 48)
        XCTAssertEqual(StepperConstants.trackingInterval, 0.5)
    }

    func testIconButtonConstants() {
        XCTAssertEqual(StepperConstants.IconButton.intent, .support)
        XCTAssertEqual(StepperConstants.IconButton.variant, .outlined)
        XCTAssertEqual(StepperConstants.IconButton.size, .medium)
        XCTAssertEqual(StepperConstants.IconButton.shape, .rounded)
    }
}
