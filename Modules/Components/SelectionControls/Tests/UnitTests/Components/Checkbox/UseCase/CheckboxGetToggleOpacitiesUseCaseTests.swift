//
//  CheckboxGetToggleOpacitiesUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 31/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Checkbox Get Toggle Opacities UseCase Tests")
struct CheckboxGetToggleOpacitiesUseCaseTests {

    // MARK: - Execute Tests

    @Test("Execute with unselected state")
    func executeWithUnselectedState() {
        // GIVEN
        let selectionState = CheckboxSelectionState.unselected

        let useCase = CheckboxGetToggleOpacitiesUseCase()

        // WHEN
        let result = useCase.execute(selectionState: selectionState)

        // THEN
        #expect(result.background == 0)
        #expect(result.border == 1)
    }

    @Test("Execute with selected state")
    func executeWithSelectedState() {
        // GIVEN
        let selectionState = CheckboxSelectionState.selected

        let useCase = CheckboxGetToggleOpacitiesUseCase()

        // WHEN
        let result = useCase.execute(selectionState: selectionState)

        // THEN
        #expect(result.background == 1)
        #expect(result.border == 0)
    }

    @Test("Execute with indeterminate state")
    func executeWithIndeterminateState() {
        // GIVEN
        let selectionState = CheckboxSelectionState.indeterminate

        let useCase = CheckboxGetToggleOpacitiesUseCase()

        // WHEN
        let result = useCase.execute(selectionState: selectionState)

        // THEN
        #expect(result.background == 1)
        #expect(result.border == 0)
    }
}
