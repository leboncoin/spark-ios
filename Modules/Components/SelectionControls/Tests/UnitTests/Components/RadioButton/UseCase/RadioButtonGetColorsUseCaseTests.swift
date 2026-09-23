//
//  RadioButtonGetColorsUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkThemingTesting

final class RadioButtonGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var getColorUseCase: CommonGetColorUseCaseableGeneratedMock!
    private var useCase: RadioButtonGetColorsUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.getColorUseCase = CommonGetColorUseCaseableGeneratedMock()
        self.useCase = RadioButtonGetColorsUseCase(getColorUseCase: self.getColorUseCase)
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
        XCTAssertTrue(result.dot.equals(expectedDot))
        XCTAssertTrue(result.hover.equals(expectedHover))

        // Verify use cases were called correctly
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenContentTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedDot
        )

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
        XCTAssertTrue(result.dot.equals(expectedDot))
        XCTAssertTrue(result.hover.equals(expectedHover))

        // Verify use cases were called correctly
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenContentTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedDot
        )

        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenHoverTheme: theme,
            givenIntent: intent,
            expectedReturnValue: expectedHover
        )
    }

    // MARK: - ExecuteDynamic Tests

    func test_executeDynamic_withIsOnTrue_returnsExpectedDynamicColors() {
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
        XCTAssertTrue(result.circle.equals(expectedCircle))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: isOn,
            expectedReturnValue: expectedCircle
        )
    }

    func test_executeDynamic_withIsOnFalse_returnsExpectedDynamicColors() {
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
        XCTAssertTrue(result.circle.equals(expectedCircle))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: isOn,
            expectedReturnValue: expectedCircle
        )
    }

    func test_executeDynamic_withErrorIntent_returnsExpectedDynamicColors() {
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
        XCTAssertTrue(result.circle.equals(expectedCircle))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenBorderTheme: theme,
            givenIntent: intent,
            givenIsSelected: isOn,
            expectedReturnValue: expectedCircle
        )
    }
}
