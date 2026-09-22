//
//  TextFieldGetIsClearButtonUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput

final class TextFieldGetIsClearButtonUseCaseTests: XCTestCase {

    // MARK: - Tests Never mode

    func test_execute_whenClearModeIsNever_andIsFocusedIsTrue_shouldReturnFalse() {
        // GIVEN
        let useCase = TextFieldGetIsClearButtonUseCase()

        let clearMode: TextFieldClearMode = .never
        let isFocused = true

        // WHEN
        let result = useCase.execute(
            clearMode: clearMode,
            isFocused: isFocused
        )

        // THEN
        XCTAssertFalse(result)
    }

    func test_execute_whenClearModeIsNever_andIsFocusedIsFalse_shouldReturnFalse() {
        // GIVEN
        let useCase = TextFieldGetIsClearButtonUseCase()

        let clearMode: TextFieldClearMode = .never
        let isFocused = false

        // WHEN
        let result = useCase.execute(
            clearMode: clearMode,
            isFocused: isFocused
        )

        // THEN
        XCTAssertFalse(result)
    }

    // MARK: Tests Always mode

    func test_execute_whenClearModeIsAlways_andIsFocusedIsTrue_shouldReturnTrue() {
        // GIVEN
        let useCase = TextFieldGetIsClearButtonUseCase()

        let clearMode: TextFieldClearMode = .always
        let isFocused = true

        // WHEN
        let result = useCase.execute(
            clearMode: clearMode,
            isFocused: isFocused
        )

        // THEN
        XCTAssertTrue(result)
    }

    func test_execute_whenClearModeIsAlways_andIsFocusedIsFalse_shouldReturnTrue() {
        // GIVEN
        let useCase = TextFieldGetIsClearButtonUseCase()

        let clearMode: TextFieldClearMode = .always
        let isFocused = false

        // WHEN
        let result = useCase.execute(
            clearMode: clearMode,
            isFocused: isFocused
        )

        // THEN
        XCTAssertTrue(result)
    }

    // MARK: Tests WhileEditing mode

    func test_execute_whenClearModeIsWhileEditing_andIsFocusedIsTrue_shouldReturnTrue() {
        // GIVEN
        let useCase = TextFieldGetIsClearButtonUseCase()

        let clearMode: TextFieldClearMode = .whileEditing
        let isFocused = true

        // WHEN
        let result = useCase.execute(
            clearMode: clearMode,
            isFocused: isFocused
        )

        // THEN
        XCTAssertTrue(result)
    }

    func test_execute_whenClearModeIsWhileEditing_andIsFocusedIsFalse_shouldReturnFalse() {
        // GIVEN
        let useCase = TextFieldGetIsClearButtonUseCase()

        let clearMode: TextFieldClearMode = .whileEditing
        let isFocused = false

        // WHEN
        let result = useCase.execute(
            clearMode: clearMode,
            isFocused: isFocused
        )

        // THEN
        XCTAssertFalse(result)
    }

    // MARK: Tests UnlessEditing mode

    func test_execute_whenClearModeIsUnlessEditing_andIsFocusedIsTrue_shouldReturnFalse() {
        // GIVEN
        let useCase = TextFieldGetIsClearButtonUseCase()

        let clearMode: TextFieldClearMode = .unlessEditing
        let isFocused = true

        // WHEN
        let result = useCase.execute(
            clearMode: clearMode,
            isFocused: isFocused
        )

        // THEN
        XCTAssertFalse(result)
    }

    func test_execute_whenClearModeIsUnlessEditing_andIsFocusedIsFalse_shouldReturnTrue() {
        // GIVEN
        let useCase = TextFieldGetIsClearButtonUseCase()

        let clearMode: TextFieldClearMode = .unlessEditing
        let isFocused = false

        // WHEN
        let result = useCase.execute(
            clearMode: clearMode,
            isFocused: isFocused
        )

        // THEN
        XCTAssertTrue(result)
    }
}
