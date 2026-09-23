//
//  CheckboxGetToggleOpacitiesUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 31/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class CheckboxGetToggleOpacitiesUseCaseTests: XCTestCase {

    // MARK: - Execute Tests

    func test_execute_withUnselectedState() {
        // GIVEN
        let selectionState = CheckboxSelectionState.unselected

        let useCase = CheckboxGetToggleOpacitiesUseCase()

        // WHEN
        let result = useCase.execute(selectionState: selectionState)

        // THEN
        XCTAssertEqual(result.background, 0)
        XCTAssertEqual(result.border, 1)
    }

    func test_execute_withSelectedState() {
        // GIVEN
        let selectionState = CheckboxSelectionState.selected

        let useCase = CheckboxGetToggleOpacitiesUseCase()

        // WHEN
        let result = useCase.execute(selectionState: selectionState)

        // THEN
        XCTAssertEqual(result.background, 1)
        XCTAssertEqual(result.border, 0)
    }

    func test_execute_withIndeterminateState() {
        // GIVEN
        let selectionState = CheckboxSelectionState.indeterminate

        let useCase = CheckboxGetToggleOpacitiesUseCase()

        // WHEN
        let result = useCase.execute(selectionState: selectionState)

        // THEN
        XCTAssertEqual(result.background, 1)
        XCTAssertEqual(result.border, 0)
    }
}
