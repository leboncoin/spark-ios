//
//  CheckboxGetIsIconUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 31/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class CheckboxGetIsIconUseCaseTests: XCTestCase {

    // MARK: - Execute Tests

    func test_execute_withUnselectedState_returnsFalse() {
        // GIVEN
        let selectionState = CheckboxSelectionState.unselected

        let useCase = CheckboxGetIsIconUseCase()

        // WHEN
        let result = useCase.execute(selectionState: selectionState)

        // THEN
        XCTAssertFalse(result, "Should return false for unselected state")
    }

    func test_execute_withSelectedState_returnsTrue() {
        // GIVEN
        let selectionState = CheckboxSelectionState.selected

        let useCase = CheckboxGetIsIconUseCase()

        // WHEN
        let result = useCase.execute(selectionState: selectionState)

        // THEN
        XCTAssertTrue(result, "Should return true for selected state")
    }

    func test_execute_withIndeterminateState_returnsTrue() {
        // GIVEN
        let selectionState = CheckboxSelectionState.indeterminate

        let useCase = CheckboxGetIsIconUseCase()

        // WHEN
        let result = useCase.execute(selectionState: selectionState)

        // THEN
        XCTAssertTrue(result, "Should return true for indeterminate state")
    }
}
