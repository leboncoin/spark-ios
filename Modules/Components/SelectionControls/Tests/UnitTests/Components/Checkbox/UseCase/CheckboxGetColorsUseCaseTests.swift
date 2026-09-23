//
//  CheckboxGetColorsUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 31/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming

final class CheckboxGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var getColorUseCase: CommonGetColorUseCaseableGeneratedMock!
    private var useCase: CheckboxGetColorsUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        self.getColorUseCase = CommonGetColorUseCaseableGeneratedMock()
        self.useCase = CheckboxGetColorsUseCase(getColorUseCase: self.getColorUseCase)
    }

    override func tearDown() {
        self.getColorUseCase = nil
        self.useCase = nil
        super.tearDown()
    }

    // MARK: - ExecuteStatic Tests

    func test_executeStatic_withSupportIntent_returnsExpectedStaticColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support
        let expectedHover = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeHoverWithHoverThemeAndIntentReturnValue = expectedHover

        // WHEN
        let result = self.useCase.executeStatic(theme: theme, intent: intent)

        // THEN
        XCTAssertTrue(result.iconForeground.equals(theme.colors.support.onSupport))
        XCTAssertTrue(result.hover.equals(expectedHover))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenHoverTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedHover
        )
    }

    func test_executeStatic_withErrorIntent_returnsExpectedStaticColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.error
        let expectedHover = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeHoverWithHoverThemeAndIntentReturnValue = expectedHover

        // WHEN
        let result = self.useCase.executeStatic(theme: theme, intent: intent)

        // THEN
        XCTAssertTrue(result.iconForeground.equals(theme.colors.feedback.onError))
        XCTAssertTrue(result.hover.equals(expectedHover))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenHoverTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedHover
        )
    }

    // MARK: - ExecuteDynamic Tests

    func test_executeDynamic_withSelectedState_returnsExpectedDynamicColors() {
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
        XCTAssertTrue(result.background.equals(expectedBackground))
        XCTAssertTrue(result.border.equals(expectedBorder))

        // Verify use cases were called correctly
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenContentTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedBackground
        )

        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: true,
            expectedReturnValue: expectedBorder
        )
    }

    func test_executeDynamic_withIndeterminateState_returnsExpectedDynamicColors() {
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
        XCTAssertTrue(result.background.equals(expectedBackground))
        XCTAssertTrue(result.border.equals(expectedBorder))

        // Verify use cases were called with isSelected = true for indeterminate
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: true,
            expectedReturnValue: expectedBorder
        )
    }

    func test_executeDynamic_withUnselectedState_returnsExpectedDynamicColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support
        let selectionState = CheckboxSelectionState.unselected
        let expectedBorder = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeBorderWithBorderThemeAndIntentAndIsSelectedReturnValue = expectedBorder

        // WHEN
        let result = self.useCase.executeDynamic(theme: theme, intent: intent, selectionState: selectionState)

        // THEN
        XCTAssertTrue(result.background.equals(ColorTokenDefault.clear))
        XCTAssertTrue(result.border.equals(expectedBorder))

        // Verify use cases were called with isSelected = false for unselected
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: false,
            expectedReturnValue: expectedBorder
        )

        // Verify content use case was not called for unselected state
        CommonGetColorUseCaseableMockTest.XCTCallsCount(
            self.getColorUseCase,
            executeContentWithContentThemeAndIntentNumberOfCalls: 0
        )
    }

    func test_executeDynamic_withErrorIntent_returnsExpectedDynamicColors() {
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
        XCTAssertTrue(result.background.equals(expectedBackground))
        XCTAssertTrue(result.border.equals(expectedBorder))

        // Verify use cases were called correctly
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenContentTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedBackground
        )

        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: true,
            expectedReturnValue: expectedBorder
        )
    }
}
