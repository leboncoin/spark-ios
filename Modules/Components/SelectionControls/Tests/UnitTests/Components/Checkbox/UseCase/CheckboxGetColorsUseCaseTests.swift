//
//  CheckboxGetColorsUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 31/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming

@Suite("Checkbox Get Colors Use Case Tests")
struct CheckboxGetColorsUseCaseTests {

    // MARK: - Properties

    private let getColorUseCase: CommonGetColorUseCaseableGeneratedMock
    private let useCase: CheckboxGetColorsUseCase

    // MARK: - Initialization

    init() {
        self.getColorUseCase = CommonGetColorUseCaseableGeneratedMock()
        self.useCase = CheckboxGetColorsUseCase(getColorUseCase: self.getColorUseCase)
    }

    // MARK: - ExecuteStatic Tests

    @Test("ExecuteStatic with support intent returns expected static colors")
    func executeStaticWithSupportIntentReturnsExpectedStaticColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support
        let expectedHover = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeHoverWithHoverThemeAndIntentReturnValue = expectedHover

        // WHEN
        let result = self.useCase.executeStatic(theme: theme, intent: intent)

        // THEN
        #expect(result.iconForeground.equals(theme.colors.support.onSupport))
        #expect(result.hover.equals(expectedHover))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenHoverTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedHover
        )
    }

    @Test("ExecuteStatic with error intent returns expected static colors")
    func executeStaticWithErrorIntentReturnsExpectedStaticColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.error
        let expectedHover = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeHoverWithHoverThemeAndIntentReturnValue = expectedHover

        // WHEN
        let result = self.useCase.executeStatic(theme: theme, intent: intent)

        // THEN
        #expect(result.iconForeground.equals(theme.colors.feedback.onError))
        #expect(result.hover.equals(expectedHover))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenHoverTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedHover
        )
    }

    // MARK: - ExecuteDynamic Tests

    @Test("ExecuteDynamic with selected state returns expected dynamic colors")
    func executeDynamicWithSelectedStateReturnsExpectedDynamicColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support
        let selectionState = CheckboxSelectionState.selected
        let expectedBackground = ColorTokenGeneratedMock.random()
        let expectedBorder = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeContentWithContentThemeAndIntentReturnValue = expectedBackground
        self.getColorUseCase.executeBorderWithBorderThemeAndIntentAndIsSelectedReturnValue = expectedBorder

        // WHEN
        let result = self.useCase.executeDynamic(theme: theme, intent: intent, selectionState: selectionState)

        // THEN
        #expect(result.background.equals(expectedBackground))
        #expect(result.border.equals(expectedBorder))

        // Verify use cases were called correctly
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenContentTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedBackground
        )

        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: true,
            expectedReturnValue: expectedBorder
        )
    }

    @Test("ExecuteDynamic with indeterminate state returns expected dynamic colors")
    func executeDynamicWithIndeterminateStateReturnsExpectedDynamicColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support
        let selectionState = CheckboxSelectionState.indeterminate
        let expectedBackground = ColorTokenGeneratedMock.random()
        let expectedBorder = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeContentWithContentThemeAndIntentReturnValue = expectedBackground
        self.getColorUseCase.executeBorderWithBorderThemeAndIntentAndIsSelectedReturnValue = expectedBorder

        // WHEN
        let result = self.useCase.executeDynamic(theme: theme, intent: intent, selectionState: selectionState)

        // THEN
        #expect(result.background.equals(expectedBackground))
        #expect(result.border.equals(expectedBorder))

        // Verify use cases were called with isSelected = true for indeterminate
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: true,
            expectedReturnValue: expectedBorder
        )
    }

    @Test("ExecuteDynamic with unselected state returns expected dynamic colors")
    func executeDynamicWithUnselectedStateReturnsExpectedDynamicColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support
        let selectionState = CheckboxSelectionState.unselected
        let expectedBorder = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeBorderWithBorderThemeAndIntentAndIsSelectedReturnValue = expectedBorder

        // WHEN
        let result = self.useCase.executeDynamic(theme: theme, intent: intent, selectionState: selectionState)

        // THEN
        #expect(result.background.equals(ColorTokenDefault.clear))
        #expect(result.border.equals(expectedBorder))

        // Verify use cases were called with isSelected = false for unselected
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: false,
            expectedReturnValue: expectedBorder
        )

        // Verify content use case was not called for unselected state
        CommonGetColorUseCaseableMockTest.expectCallsCount(
            self.getColorUseCase,
            executeContentWithContentThemeAndIntentNumberOfCalls: 0
        )
    }

    @Test("ExecuteDynamic with error intent returns expected dynamic colors")
    func executeDynamicWithErrorIntentReturnsExpectedDynamicColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.error
        let selectionState = CheckboxSelectionState.selected
        let expectedBackground = ColorTokenGeneratedMock.random()
        let expectedBorder = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeContentWithContentThemeAndIntentReturnValue = expectedBackground
        self.getColorUseCase.executeBorderWithBorderThemeAndIntentAndIsSelectedReturnValue = expectedBorder

        // WHEN
        let result = self.useCase.executeDynamic(theme: theme, intent: intent, selectionState: selectionState)

        // THEN
        #expect(result.background.equals(expectedBackground))
        #expect(result.border.equals(expectedBorder))

        // Verify use cases were called correctly
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenContentTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedBackground
        )

        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: true,
            expectedReturnValue: expectedBorder
        )
    }
}
