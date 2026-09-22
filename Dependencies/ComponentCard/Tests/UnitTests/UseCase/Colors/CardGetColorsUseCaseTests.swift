//
//  CardGetColorsUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@_spi(SI_SPI) @testable import SparkComponentCardTesting
@testable @_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

@Suite("CardGetColorsUseCase Tests")
struct CardGetColorsUseCaseTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let mockOutlinedUseCase = CardGetStateColorsUseCaseableGeneratedMock()
    private let mockTintedUseCase = CardGetStateColorsUseCaseableGeneratedMock()
    private let useCase: CardGetColorsUseCase

    // MARK: - Initialization

    init() {
        self.useCase = CardGetColorsUseCase(
            getStateOutlinedColorsUseCase: self.mockOutlinedUseCase,
            getStateTintedColorsUseCase: self.mockTintedUseCase
        )
    }

    // MARK: - Tests

    @Test("Execute with filled variant and not pressed")
    func testExecuteWithFilledVariantAndNotPressed() {
        // GIVEN
        let variant = CardVariant.filled
        let intent = CardIntent.accent
        let isPressed = false

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random(),
            foreground: ColorTokenGeneratedMock.random()
        )
        self.mockTintedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let expectedColors = CardColors(
            background: mockStateColors.background,
            foreground: mockStateColors.foreground,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.border
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isPressed: isPressed
        )

        // THEN
        CardGetStateColorsUseCaseableMockTest.expect(
            self.mockTintedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.expectCalled(
            self.mockOutlinedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        #expect(colors == expectedColors)
    }

    @Test("Execute with filled variant and pressed")
    func testExecuteWithFilledVariantAndPressed() {
        // GIVEN
        let variant = CardVariant.filled
        let intent = CardIntent.main
        let isPressed = true

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random(),
            foreground: ColorTokenGeneratedMock.random()
        )
        self.mockTintedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let expectedColors = CardColors(
            background: mockStateColors.pressedBackground,
            foreground: mockStateColors.foreground,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.pressedBorder
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isPressed: isPressed
        )

        // THEN
        CardGetStateColorsUseCaseableMockTest.expect(
            self.mockTintedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )

        #expect(colors == expectedColors)
    }

    @Test("Execute with outlined variant and not pressed")
    func testExecuteWithOutlinedVariantAndNotPressed() {
        // GIVEN
        let variant = CardVariant.outlined
        let intent = CardIntent.error
        let isPressed = false

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random(),
            foreground: ColorTokenGeneratedMock.random()
        )
        self.mockOutlinedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let expectedColors = CardColors(
            background: mockStateColors.background,
            foreground: mockStateColors.foreground,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.border
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isPressed: isPressed
        )

        // THEN
        CardGetStateColorsUseCaseableMockTest.expect(
            self.mockOutlinedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.expectCalled(
            self.mockTintedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        #expect(colors == expectedColors)
    }

    @Test("Execute with outlined variant and pressed")
    func testExecuteWithOutlinedVariantAndPressed() {
        // GIVEN
        let variant = CardVariant.outlined
        let intent = CardIntent.info
        let isPressed = true

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random(),
            foreground: ColorTokenGeneratedMock.random()
        )
        self.mockOutlinedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let expectedColors = CardColors(
            background: mockStateColors.pressedBackground,
            foreground: mockStateColors.foreground,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.pressedBorder
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isPressed: isPressed
        )

        // THEN
        CardGetStateColorsUseCaseableMockTest.expect(
            self.mockOutlinedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.expectCalled(
            self.mockTintedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        #expect(colors == expectedColors)
    }

    @Test("Execute with tinted variant and not pressed")
    func testExecuteWithTintedVariantAndNotPressed() {
        // GIVEN
        let variant = CardVariant.tinted
        let intent = CardIntent.neutral
        let isPressed = false

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random(),
            foreground: ColorTokenGeneratedMock.random()
        )
        self.mockTintedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let expectedColors = CardColors(
            background: mockStateColors.background,
            foreground: mockStateColors.foreground,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.border
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isPressed: isPressed
        )

        // THEN
        CardGetStateColorsUseCaseableMockTest.expect(
            self.mockTintedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.expectCalled(
            self.mockOutlinedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        #expect(colors == expectedColors)
    }

    @Test("Execute with tinted variant and pressed")
    func testExecuteWithTintedVariantAndPressed() {
        // GIVEN
        let variant = CardVariant.tinted
        let intent = CardIntent.success
        let isPressed = true

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random(),
            foreground: ColorTokenGeneratedMock.random()
        )
        self.mockTintedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let expectedColors = CardColors(
            background: mockStateColors.pressedBackground,
            foreground: mockStateColors.foreground,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.pressedBorder
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isPressed: isPressed
        )

        // THEN
        CardGetStateColorsUseCaseableMockTest.expect(
            self.mockTintedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.expectCalled(
            self.mockOutlinedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        #expect(colors == expectedColors)
    }
}
