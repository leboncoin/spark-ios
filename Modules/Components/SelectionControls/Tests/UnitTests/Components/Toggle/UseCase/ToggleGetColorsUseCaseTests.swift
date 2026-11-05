//
//  ToggleGetColorsUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Toggle Get Colors Use Case Tests")
struct ToggleGetColorsUseCaseTests {

    // MARK: - Properties

    private let getColorUseCase: CommonGetColorUseCaseableGeneratedMock
    private let useCase: ToggleGetColorsUseCase

    // MARK: - Initialization

    init() {
        self.getColorUseCase = CommonGetColorUseCaseableGeneratedMock()
        self.useCase = ToggleGetColorsUseCase(getColorUseCase: self.getColorUseCase)
    }

    // MARK: - ExecuteStatic Tests

    @Test("ExecuteStatic returns expected static colors")
    func executeStaticReturnsExpectedStaticColors() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let expectedHover = ColorTokenGeneratedMock.random()

        self.getColorUseCase.executeHoverWithHoverThemeAndIntentReturnValue = expectedHover

        // WHEN
        let result = self.useCase.executeStatic(theme: theme)

        // THEN
        #expect(result.dotBackground.equals(theme.colors.base.surface))
        #expect(result.hover.equals(expectedHover))

        // Verify use cases were called correctly
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenHoverTheme: theme,
            givenIntent: .support,
            expectedReturnValue: expectedHover
        )
    }

    // MARK: - ExecuteDynamic Tests

    @Test("ExecuteDynamic when is on returns expected dynamic colors")
    func executeDynamicWhenIsOnReturnsExpectedDynamicColors() {
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
        #expect(result.background.equals(expectedContent))
        #expect(result.dotForeground.equals(expectedContent))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenContentTheme: theme,
            givenIntent: .support,
            expectedReturnValue: expectedContent
        )
    }

    @Test("ExecuteDynamic when is off returns expected dynamic colors")
    func executeDynamicWhenIsOffReturnsExpectedDynamicColors() {
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
        #expect(result.background.equals(expectedContent.opacity(theme.dims.dim3)))
        #expect(result.dotForeground.equals(expectedContent.opacity(theme.dims.dim2)))

        // Verify use case was called correctly
        CommonGetColorUseCaseableMockTest.expect(
            self.getColorUseCase,
            expectedNumberOfCalls: 1,
            givenContentTheme: theme,
            givenIntent: .support,
            expectedReturnValue: expectedContent
        )
    }
}
