//
//  RadioButtonGetShowSelectedDotUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class RadioButtonGetShowSelectedDotUseCaseTests: XCTestCase {

    // MARK: - Execute Tests

    func test_execute_withIsSelectedTrue_returnsTrue() {
        // GIVEN
        let isSelected = true

        let useCase = RadioButtonGetShowSelectedDotUseCase()

        // WHEN
        let result = useCase.execute(isSelected: isSelected)

        // THEN
        XCTAssertTrue(result)
    }

    func test_execute_withIsSelectedFalse_returnsFalse() {
        // GIVEN
        let isSelected = false

        let useCase = RadioButtonGetShowSelectedDotUseCase()

        // WHEN
        let result = useCase.execute(isSelected: isSelected)

        // THEN
        XCTAssertFalse(result)
    }
}
