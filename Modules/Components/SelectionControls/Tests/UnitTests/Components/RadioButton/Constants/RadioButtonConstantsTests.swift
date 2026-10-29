//
//  RadioButtonConstantsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Radio Button Constants Tests")
struct RadioButtonConstantsTests {

    // MARK: - Constants Tests

    @Test("Size should return expected value")
    func sizeShouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = RadioButtonConstants.size

        // THEN
        #expect(result == 24.0)
    }

    @Test("Dot size should return expected value")
    func dotSizeShouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = RadioButtonConstants.dotSize

        // THEN
        #expect(result == 12.0)
    }

    @Test("Line width should return expected value")
    func lineWidthShouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = RadioButtonConstants.lineWidth

        // THEN
        #expect(result == 2.0)
    }
}