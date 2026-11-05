//
//  RadioButtonGetColorsUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkThemingTesting

@Suite("RadioButton Get Colors Use Case Tests")
struct RadioButtonGetColorsUseCaseTests {

    // MARK: - Properties

    private let getColorUseCase: CommonGetColorUseCaseableGeneratedMock
    private let useCase: RadioButtonGetColorsUseCase

    // MARK: - Initialization

    init() {
        self.getColorUseCase = CommonGetColorUseCaseableGeneratedMock()
        self.useCase = RadioButtonGetColorsUseCase(getColorUseCase: self.getColorUseCase)
    }

    // MARK: - ExecuteStatic Tests

    @Test("ExecuteStatic with support intent returns expected static colors")
    func executeStaticWithSupportIntentReturnsExpectedStaticColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support
        let expectedDot = ColorTokenGeneratedMock.random()
        let expectedHover = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeContentWithContentThemeAndIntentReturnValue = expectedDot
        self.getColorUseCase.executeHoverWithHoverThemeAndIntentReturnValue = expectedHover

        // WHEN
        let result = self.useCase.executeStatic(
            theme: theme,
            intent: intent
        )

        // THEN
        #expect(result.dot.equals(expectedDot))
        #expect(result.hover.equals(expectedHover))

        // Verify use cases were called correctly
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenContentTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedDot
        )

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
        let expectedDot = ColorTokenGeneratedMock.random()
        let expectedHover = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeContentWithContentThemeAndIntentReturnValue = expectedDot
        self.getColorUseCase.executeHoverWithHoverThemeAndIntentReturnValue = expectedHover

        // WHEN
        let result = self.useCase.executeStatic(
            theme: theme,
            intent: intent
        )

        // THEN
        #expect(result.dot.equals(expectedDot))
        #expect(result.hover.equals(expectedHover))

        // Verify use cases were called correctly
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenContentTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedDot
        )

        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenHoverTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedHover
        )
    }

    // MARK: - ExecuteDynamic Tests

    @Test("ExecuteDynamic with is on true returns expected dynamic colors")
    func executeDynamicWithIsOnTrueReturnsExpectedDynamicColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support
        let isOn = true
        let expectedCircle = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeBorderWithBorderThemeAndIntentAndIsSelectedReturnValue = expectedCircle

        // WHEN
        let result = self.useCase.executeDynamic(
            theme: theme,
            intent: intent,
            isOn: isOn
        )

        // THEN
        #expect(result.circle.equals(expectedCircle))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: isOn,
            expectedReturnValue: expectedCircle
        )
    }

    @Test("ExecuteDynamic with is on false returns expected dynamic colors")
    func executeDynamicWithIsOnFalseReturnsExpectedDynamicColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.support
        let isOn = false
        let expectedCircle = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeBorderWithBorderThemeAndIntentAndIsSelectedReturnValue = expectedCircle

        // WHEN
        let result = self.useCase.executeDynamic(
            theme: theme,
            intent: intent,
            isOn: isOn
        )

        // THEN
        #expect(result.circle.equals(expectedCircle))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: isOn,
            expectedReturnValue: expectedCircle
        )
    }

    @Test("ExecuteDynamic with error intent returns expected dynamic colors")
    func executeDynamicWithErrorIntentReturnsExpectedDynamicColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let intent = SelectionControlsIntent.error
        let isOn = true
        let expectedCircle = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeBorderWithBorderThemeAndIntentAndIsSelectedReturnValue = expectedCircle

        // WHEN
        let result = self.useCase.executeDynamic(
            theme: theme,
            intent: intent,
            isOn: isOn
        )

        // THEN
        #expect(result.circle.equals(expectedCircle))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: isOn,
            expectedReturnValue: expectedCircle
        )
    }
}
