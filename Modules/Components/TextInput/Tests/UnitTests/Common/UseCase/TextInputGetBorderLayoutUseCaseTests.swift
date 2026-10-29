//
//  TextInputGetBorderLayoutUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Text Input Get Border Layout UseCase Tests")
struct TextInputGetBorderLayoutUseCaseTests {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests for execute with borderStyle

    @Test("Execute with none border style should return correct layout")
    func executeWithNoneBorderStyleShouldReturnCorrectLayout() {
        // GIVEN
        let useCase = TextInputGetBorderLayoutUseCase()

        let borderStyle = TextInputBorderStyle.none
        let isFocused = true

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            borderStyle: borderStyle,
            isFocused: isFocused
        )

        // THEN
        #expect(result.radius == self.themeMock.border.radius.none)
        #expect(result.width == self.themeMock.border.width.none)
    }

    @Test("Execute with rounded rect border style when focused should return correct layout")
    func executeWithRoundedRectBorderStyleWhenFocusedShouldReturnCorrectLayout() {
        // GIVEN
        let useCase = TextInputGetBorderLayoutUseCase()

        let borderStyle = TextInputBorderStyle.roundedRect
        let isFocused = true

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            borderStyle: borderStyle,
            isFocused: isFocused
        )

        // THEN
        #expect(result.radius == self.themeMock.border.radius.full)
        #expect(result.width == self.themeMock.border.width.medium)
    }

    @Test("Execute with rounded rect border style when not focused should return correct layout")
    func executeWithRoundedRectBorderStyleWhenNotFocusedShouldReturnCorrectLayout() {
        // GIVEN
        let useCase = TextInputGetBorderLayoutUseCase()

        let borderStyle = TextInputBorderStyle.roundedRect
        let isFocused = false

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            borderStyle: borderStyle,
            isFocused: isFocused
        )

        // THEN
        #expect(result.radius == self.themeMock.border.radius.full)
        #expect(result.width == self.themeMock.border.width.small)
    }

    // MARK: - Tests for execute without borderStyle

    @Test("Execute without border style when focused should return correct layout")
    func executeWithoutBorderStyleWhenFocusedShouldReturnCorrectLayout() {
        // GIVEN
        let useCase = TextInputGetBorderLayoutUseCase()

        let isFocused = true

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            isFocused: isFocused
        )

        // THEN
        #expect(result.radius == self.themeMock.border.radius.full)
        #expect(result.width == self.themeMock.border.width.medium)
    }

    @Test("Execute without border style when not focused should return correct layout")
    func executeWithoutBorderStyleWhenNotFocusedShouldReturnCorrectLayout() {
        // GIVEN
        let useCase = TextInputGetBorderLayoutUseCase()

        let isFocused = false

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            isFocused: isFocused
        )

        // THEN
        #expect(result.radius == self.themeMock.border.radius.full)
        #expect(result.width == self.themeMock.border.width.small)
    }

    @Test("Execute with none border style should return none")
    func executeWithNoneBorderStyleShouldReturnNone() {
        // GIVEN
        let useCase = TextInputGetBorderLayoutUseCase()

        let borderStyle = TextInputBorderStyle.none
        let isFocused = true

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            borderStyle: borderStyle,
            isFocused: isFocused
        )

        // THEN
        #expect(result.radius == self.themeMock.border.radius.none)
        #expect(result.width == self.themeMock.border.width.none)
    }
}
