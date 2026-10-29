//
//  CheckboxConstantsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Checkbox Constants Tests")
struct CheckboxConstantsTests {

    // MARK: - Constants Tests

    @Test("Second animation duration should return expected value")
    func secondAnimationDurationShouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = CheckboxConstants.secondAnimationDuration

        // THEN
        #expect(result == 0.3)
    }

    @Test("Size should return expected value")
    func sizeShouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = CheckboxConstants.size

        // THEN
        #expect(result == 24.0)
    }

    @Test("Icon padding should return expected value")
    func iconPaddingShouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = CheckboxConstants.iconPadding

        // THEN
        #expect(result == 2.0)
    }

    @Test("Line width should return expected value")
    func lineWidthShouldReturnExpectedValue() {
        // GIVEN / WHEN
        let result = CheckboxConstants.lineWidth

        // THEN
        #expect(result == 2.0)
    }
}