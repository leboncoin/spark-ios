//
//  ToggleGetColorsUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkThemingTesting

final class ToggleGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var getColorUseCase: CommonGetColorUseCaseableGeneratedMock!
    private var useCase: ToggleGetColorsUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.getColorUseCase = CommonGetColorUseCaseableGeneratedMock()
        self.useCase = ToggleGetColorsUseCase(getColorUseCase: self.getColorUseCase)
    }

    override func tearDown() {
        self.getColorUseCase = nil
        self.useCase = nil

        super.tearDown()
    }

    // MARK: - ExecuteStatic Tests

    func test_executeStatic_returnsExpectedStaticColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let expectedHover = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeHoverWithHoverThemeAndIntentReturnValue = expectedHover

        // WHEN
        let result = self.useCase.executeStatic(theme: theme)

        // THEN
        XCTAssertTrue(result.dotBackground.equals(theme.colors.base.surface))
        XCTAssertTrue(result.hover.equals(expectedHover))

        // Verify use cases were called correctly
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenHoverTheme: theme,
            givenIntent: .support,
            expectedReturnValue: expectedHover
        )
    }

    // MARK: - ExecuteDynamic Tests

    func test_executeDynamic_whenIsOn_returnsExpectedDynamicColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let isOn = true
        let expectedContent = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeContentWithContentThemeAndIntentReturnValue = expectedContent

        // WHEN
        let result = self.useCase.executeDynamic(
            theme: theme,
            isOn: isOn
        )

        // THEN
        XCTAssertTrue(result.background.equals(expectedContent))
        XCTAssertTrue(result.dotForeground.equals(expectedContent))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenContentTheme: theme,
            givenIntent: .support,
            expectedReturnValue: expectedContent
        )
    }

    func test_executeDynamic_whenIsOff_returnsExpectedDynamicColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let isOn = false
        let expectedContent = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeContentWithContentThemeAndIntentReturnValue = expectedContent

        // WHEN
        let result = self.useCase.executeDynamic(
            theme: theme,
            isOn: isOn
        )

        // THEN
        XCTAssertTrue(result.background.equals(expectedContent.opacity(theme.dims.dim3)))
        XCTAssertTrue(result.dotForeground.equals(expectedContent.opacity(theme.dims.dim2)))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.XCTAssert(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenContentTheme: theme,
            givenIntent: .support,
            expectedReturnValue: expectedContent
        )
    }
}
