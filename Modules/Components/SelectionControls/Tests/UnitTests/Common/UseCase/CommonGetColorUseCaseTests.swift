//
//  CommonGetColorUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Common Get Color UseCase Tests")
struct CommonGetColorUseCaseTests {

    // MARK: - ExecuteContent Tests

    @Test("Execute content with support intent returns support color")
    func executeContentWithSupportIntentReturnsSupportColor() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support

        let useCase = CommonGetColorUseCase()

        // WHEN
        let result = useCase.executeContent(
            theme: theme,
            intent: intent
        )

        // THEN
        #expect(result.equals(theme.colors.support.support))
    }

    @Test("Execute content with error intent returns error color")
    func executeContentWithErrorIntentReturnsErrorColor() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.error

        let useCase = CommonGetColorUseCase()

        // WHEN
        let result = useCase.executeContent(
            theme: theme,
            intent: intent
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.error))
    }

    // MARK: - ExecuteBorder Tests

    @Test("Execute border with support intent and selected returns support color")
    func executeBorderWithSupportIntentAndSelectedReturnsSupportColor() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support
        let isSelected = true

        let useCase = CommonGetColorUseCase()

        // WHEN
        let result = useCase.executeBorder(
            theme: theme,
            intent: intent,
            isSelected: isSelected
        )

        // THEN
        #expect(result.equals(theme.colors.support.support))
    }

    @Test("Execute border with support intent and not selected returns outline color")
    func executeBorderWithSupportIntentAndNotSelectedReturnsOutlineColor() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support
        let isSelected = false

        let useCase = CommonGetColorUseCase()

        // WHEN
        let result = useCase.executeBorder(
            theme: theme,
            intent: intent,
            isSelected: isSelected
        )

        // THEN
        #expect(result.equals(theme.colors.base.outline))
    }

    @Test("Execute border with error intent and selected returns error color")
    func executeBorderWithErrorIntentAndSelectedReturnsErrorColor() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.error
        let isSelected = true

        let useCase = CommonGetColorUseCase()

        // WHEN
        let result = useCase.executeBorder(
            theme: theme,
            intent: intent,
            isSelected: isSelected
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.error))
    }

    @Test("Execute border with error intent and not selected returns error color")
    func executeBorderWithErrorIntentAndNotSelectedReturnsErrorColor() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.error
        let isSelected = false

        let useCase = CommonGetColorUseCase()

        // WHEN
        let result = useCase.executeBorder(
            theme: theme,
            intent: intent,
            isSelected: isSelected
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.error))
    }

    // MARK: - ExecuteHover Tests

    @Test("Execute hover with support intent returns support container color")
    func executeHoverWithSupportIntentReturnsSupportContainerColor() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support

        let useCase = CommonGetColorUseCase()

        // WHEN
        let result = useCase.executeHover(
            theme: theme,
            intent: intent
        )

        // THEN
        #expect(result.equals(theme.colors.support.supportContainer))
    }

    @Test("Execute hover with error intent returns error container color")
    func executeHoverWithErrorIntentReturnsErrorContainerColor() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.error

        let useCase = CommonGetColorUseCase()

        // WHEN
        let result = useCase.executeHover(
            theme: theme,
            intent: intent
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.errorContainer))
    }
}
