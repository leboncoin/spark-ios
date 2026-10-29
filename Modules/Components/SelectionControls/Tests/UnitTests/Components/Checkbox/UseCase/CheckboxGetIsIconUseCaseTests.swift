//
//  CheckboxGetIsIconUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 31/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Checkbox Get Is Icon UseCase Tests")
struct CheckboxGetIsIconUseCaseTests {

    // MARK: - Execute Tests

    @Test("Execute with unselected state returns false")
    func executeWithUnselectedStateReturnsFalse() {
        // GIVEN
        let selectionState = CheckboxSelectionState.unselected

        let useCase = CheckboxGetIsIconUseCase()

        // WHEN
        let result = useCase.execute(selectionState: selectionState)

        // THEN
        #expect(!result, "Should return false for unselected state")
    }

    @Test("Execute with selected state returns true")
    func executeWithSelectedStateReturnsTrue() {
        // GIVEN
        let selectionState = CheckboxSelectionState.selected

        let useCase = CheckboxGetIsIconUseCase()

        // WHEN
        let result = useCase.execute(selectionState: selectionState)

        // THEN
        #expect(result, "Should return true for selected state")
    }

    @Test("Execute with indeterminate state returns true")
    func executeWithIndeterminateStateReturnsTrue() {
        // GIVEN
        let selectionState = CheckboxSelectionState.indeterminate

        let useCase = CheckboxGetIsIconUseCase()

        // WHEN
        let result = useCase.execute(selectionState: selectionState)

        // THEN
        #expect(result, "Should return true for indeterminate state")
    }
}
