//
//  CheckboxGetNewSelectedValueUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 09/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class CheckboxGetNewSelectedValueUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase: CheckboxGetNewSelectedValueUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        self.useCase = CheckboxGetNewSelectedValueUseCase()
    }

    override func tearDown() {
        self.useCase = nil
        super.tearDown()
    }

    // MARK: - Execute With IsEnabled equals to true Tests

    func test_execute_withSelectedState_and_isEnabledAtTrue_returnsUnselected() {
        // GIVEN
        let selectionState = CheckboxSelectionState.selected

        // WHEN
        let result = self.useCase.execute(
            selectionState: selectionState,
            isEnabled: true
        )

        // THEN
        XCTAssertEqual(result, .unselected)
    }

    func test_execute_withUnselectedState_and_isEnabledAtTrue_returnsSelected() {
        // GIVEN
        let selectionState = CheckboxSelectionState.unselected

        // WHEN
        let result = self.useCase.execute(
            selectionState: selectionState,
            isEnabled: true
        )

        // THEN
        XCTAssertEqual(result, .selected)
    }

    func test_execute_withIndeterminateState_and_isEnabledAtTrue_returnsSelected() {
        // GIVEN
        let selectionState = CheckboxSelectionState.indeterminate

        // WHEN
        let result = self.useCase.execute(
            selectionState: selectionState,
            isEnabled: true
        )

        // THEN
        XCTAssertEqual(result, .selected)
    }

    // MARK: - Execute With IsEnabled equals to false Tests

    func test_execute_withSelectedState_and_isEnabledAtFalse_returnsUnselected() {
        // GIVEN
        let selectionState = CheckboxSelectionState.selected

        // WHEN
        let result = self.useCase.execute(
            selectionState: selectionState,
            isEnabled: false
        )

        // THEN
        XCTAssertNil(result)
    }

    func test_execute_withUnselectedState_and_isEnabledAtFalse_returnsSelected() {
        // GIVEN
        let selectionState = CheckboxSelectionState.unselected

        // WHEN
        let result = self.useCase.execute(
            selectionState: selectionState,
            isEnabled: false
        )

        // THEN
        XCTAssertNil(result)
    }

    func test_execute_withIndeterminateState_and_isEnabledAtFalse_returnsSelected() {
        // GIVEN
        let selectionState = CheckboxSelectionState.indeterminate

        // WHEN
        let result = self.useCase.execute(
            selectionState: selectionState,
            isEnabled: false
        )

        // THEN
        XCTAssertNil(result)
    }
}
