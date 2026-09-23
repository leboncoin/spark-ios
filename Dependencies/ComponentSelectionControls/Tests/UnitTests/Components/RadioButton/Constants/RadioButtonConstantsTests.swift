//
//  RadioButtonConstantsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class RadioButtonConstantsTests: XCTestCase {

    // MARK: - Constants Tests

    func test_size_shouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = RadioButtonConstants.size

        // THEN
        XCTAssertEqual(result, 24.0)
    }

    func test_dotSize_shouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = RadioButtonConstants.dotSize

        // THEN
        XCTAssertEqual(result, 12.0)
    }

    func test_lineWidth_shouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = RadioButtonConstants.lineWidth

        // THEN
        XCTAssertEqual(result, 2.0)
    }
}