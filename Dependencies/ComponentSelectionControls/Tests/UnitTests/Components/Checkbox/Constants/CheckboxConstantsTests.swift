//
//  CheckboxConstantsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class CheckboxConstantsTests: XCTestCase {

    // MARK: - Constants Tests

    func test_secondAnimationDuration_shouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = CheckboxConstants.secondAnimationDuration

        // THEN
        XCTAssertEqual(result, 0.3)
    }

    func test_size_shouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = CheckboxConstants.size

        // THEN
        XCTAssertEqual(result, 24.0)
    }

    func test_iconPadding_shouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = CheckboxConstants.iconPadding

        // THEN
        XCTAssertEqual(result, 2.0)
    }

    func test_lineWidth_shouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = CheckboxConstants.lineWidth

        // THEN
        XCTAssertEqual(result, 2.0)
    }
}