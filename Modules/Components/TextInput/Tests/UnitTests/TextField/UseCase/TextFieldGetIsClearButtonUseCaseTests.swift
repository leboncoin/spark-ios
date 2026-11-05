//
//  TextFieldGetIsClearButtonUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextInput

@Suite("Text Field Get Is Clear Button UseCase Tests")
struct TextFieldGetIsClearButtonUseCaseTests {

    // MARK: - Tests Never mode

    @Test("Execute when clear mode is never and is focused is true should return false")
    func executeWhenClearModeIsNeverAndIsFocusedIsTrueShouldReturnFalse() {
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
        #expect(!result)
    }

    @Test("Execute when clear mode is never and is focused is false should return false")
    func executeWhenClearModeIsNeverAndIsFocusedIsFalseShouldReturnFalse() {
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
        #expect(!result)
    }

    // MARK: Tests Always mode

    @Test("Execute when clear mode is always and is focused is true should return true")
    func executeWhenClearModeIsAlwaysAndIsFocusedIsTrueShouldReturnTrue() {
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
        #expect(result)
    }

    @Test("Execute when clear mode is always and is focused is false should return true")
    func executeWhenClearModeIsAlwaysAndIsFocusedIsFalseShouldReturnTrue() {
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
        #expect(result)
    }

    // MARK: Tests WhileEditing mode

    @Test("Execute when clear mode is while editing and is focused is true should return true")
    func executeWhenClearModeIsWhileEditingAndIsFocusedIsTrueShouldReturnTrue() {
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
        #expect(result)
    }

    @Test("Execute when clear mode is while editing and is focused is false should return false")
    func executeWhenClearModeIsWhileEditingAndIsFocusedIsFalseShouldReturnFalse() {
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
        #expect(!result)
    }

    // MARK: Tests UnlessEditing mode

    @Test("Execute when clear mode is unless editing and is focused is true should return false")
    func executeWhenClearModeIsUnlessEditingAndIsFocusedIsTrueShouldReturnFalse() {
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
        #expect(!result)
    }

    @Test("Execute when clear mode is unless editing and is focused is false should return true")
    func executeWhenClearModeIsUnlessEditingAndIsFocusedIsFalseShouldReturnTrue() {
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
        #expect(result)
    }
}
