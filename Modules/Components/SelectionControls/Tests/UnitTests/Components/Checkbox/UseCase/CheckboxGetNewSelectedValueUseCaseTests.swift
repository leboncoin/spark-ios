//
//  CheckboxGetNewSelectedValueUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 09/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Checkbox Get New Selected Value UseCase Tests")
struct CheckboxGetNewSelectedValueUseCaseTests {

    // MARK: - Properties

    private let useCase: CheckboxGetNewSelectedValueUseCase

    // MARK: - Initialization

    init() {
        self.useCase = CheckboxGetNewSelectedValueUseCase()
    }

    // MARK: - Execute With IsEnabled equals to true Tests

    @Test("Execute with selected state and is enabled at true returns unselected")
    func executeWithSelectedStateAndIsEnabledAtTrueReturnsUnselected() {
        // GIVEN
        let selectionState = CheckboxSelectionState.selected

        // WHEN
        let result = self.useCase.execute(
            selectionState: selectionState,
            isEnabled: true
        )

        // THEN
        #expect(result == .unselected)
    }

    @Test("Execute with unselected state and is enabled at true returns selected")
    func executeWithUnselectedStateAndIsEnabledAtTrueReturnsSelected() {
        // GIVEN
        let selectionState = CheckboxSelectionState.unselected

        // WHEN
        let result = self.useCase.execute(
            selectionState: selectionState,
            isEnabled: true
        )

        // THEN
        #expect(result == .selected)
    }

    @Test("Execute with indeterminate state and is enabled at true returns selected")
    func executeWithIndeterminateStateAndIsEnabledAtTrueReturnsSelected() {
        // GIVEN
        let selectionState = CheckboxSelectionState.indeterminate

        // WHEN
        let result = self.useCase.execute(
            selectionState: selectionState,
            isEnabled: true
        )

        // THEN
        #expect(result == .selected)
    }

    // MARK: - Execute With IsEnabled equals to false Tests

    @Test("Execute with selected state and is enabled at false returns unselected")
    func executeWithSelectedStateAndIsEnabledAtFalseReturnsUnselected() {
        // GIVEN
        let selectionState = CheckboxSelectionState.selected

        // WHEN
        let result = self.useCase.execute(
            selectionState: selectionState,
            isEnabled: false
        )

        // THEN
        #expect(result == nil)
    }

    @Test("Execute with unselected state and is enabled at false returns selected")
    func executeWithUnselectedStateAndIsEnabledAtFalseReturnsSelected() {
        // GIVEN
        let selectionState = CheckboxSelectionState.unselected

        // WHEN
        let result = self.useCase.execute(
            selectionState: selectionState,
            isEnabled: false
        )

        // THEN
        #expect(result == nil)
    }

    @Test("Execute with indeterminate state and is enabled at false returns selected")
    func executeWithIndeterminateStateAndIsEnabledAtFalseReturnsSelected() {
        // GIVEN
        let selectionState = CheckboxSelectionState.indeterminate

        // WHEN
        let result = self.useCase.execute(
            selectionState: selectionState,
            isEnabled: false
        )

        // THEN
        #expect(result == nil)
    }
}
