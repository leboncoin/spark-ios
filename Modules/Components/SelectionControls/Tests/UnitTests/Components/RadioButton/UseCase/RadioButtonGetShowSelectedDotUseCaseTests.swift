//
//  RadioButtonGetShowSelectedDotUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Radio Button Get Show Selected Dot UseCase Tests")
struct RadioButtonGetShowSelectedDotUseCaseTests {

    // MARK: - Execute Tests

    @Test("Execute with is selected true returns true")
    func executeWithIsSelectedTrueReturnsTrue() {
        // GIVEN
        let isSelected = true

        let useCase = RadioButtonGetShowSelectedDotUseCase()

        // WHEN
        let result = useCase.execute(isSelected: isSelected)

        // THEN
        #expect(result)
    }

    @Test("Execute with is selected false returns false")
    func executeWithIsSelectedFalseReturnsFalse() {
        // GIVEN
        let isSelected = false

        let useCase = RadioButtonGetShowSelectedDotUseCase()

        // WHEN
        let result = useCase.execute(isSelected: isSelected)

        // THEN
        #expect(!result)
    }
}
