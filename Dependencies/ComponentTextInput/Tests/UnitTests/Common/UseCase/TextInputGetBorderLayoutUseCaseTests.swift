//
//  TextInputGetBorderLayoutUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting

final class TextInputGetBorderLayoutUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests for execute with borderStyle

    func test_execute_withNoneBorderStyle_shouldReturnCorrectLayout() {
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
        XCTAssertEqual(result.radius, self.themeMock.border.radius.none)
        XCTAssertEqual(result.width, self.themeMock.border.width.none)
    }

    func test_execute_withRoundedRectBorderStyle_whenFocused_shouldReturnCorrectLayout() {
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
        XCTAssertEqual(result.radius, self.themeMock.border.radius.full)
        XCTAssertEqual(result.width, self.themeMock.border.width.medium)
    }

    func test_execute_withRoundedRectBorderStyle_whenNotFocused_shouldReturnCorrectLayout() {
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
        XCTAssertEqual(result.radius, self.themeMock.border.radius.full)
        XCTAssertEqual(result.width, self.themeMock.border.width.small)
    }

    // MARK: - Tests for execute without borderStyle

    func test_execute_withoutBorderStyle_whenFocused_shouldReturnCorrectLayout() {
        // GIVEN
        let useCase = TextInputGetBorderLayoutUseCase()

        let isFocused = true

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            isFocused: isFocused
        )

        // THEN
        XCTAssertEqual(result.radius, self.themeMock.border.radius.full)
        XCTAssertEqual(result.width, self.themeMock.border.width.medium)
    }

    func test_execute_withoutBorderStyle_whenNotFocused_shouldReturnCorrectLayout() {
        // GIVEN
        let useCase = TextInputGetBorderLayoutUseCase()

        let isFocused = false

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            isFocused: isFocused
        )

        // THEN
        XCTAssertEqual(result.radius, self.themeMock.border.radius.full)
        XCTAssertEqual(result.width, self.themeMock.border.width.small)
    }

    func test_execute_withNoneBorderStyle_shouldReturnNone() {
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
        XCTAssertEqual(result.radius, self.themeMock.border.radius.none)
        XCTAssertEqual(result.width, self.themeMock.border.width.none)
    }
}
