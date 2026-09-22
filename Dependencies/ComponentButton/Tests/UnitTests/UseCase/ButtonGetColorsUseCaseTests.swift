//
//  ButtonGetColorsUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 27/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) @testable import SparkComponentButtonTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Colors Use Case Tests")
struct ButtonGetColorsUseCaseTests {

    // MARK: - Properties

    let sut: ButtonGetColorsUseCase
    let theme: ThemeGeneratedMock
    let getContrastUseCase: ButtonGetVariantUseCaseableGeneratedMock
    let getFilledUseCase: ButtonGetVariantUseCaseableGeneratedMock
    let getGhostUseCase: ButtonGetVariantUseCaseableGeneratedMock
    let getOutlinedUseCase: ButtonGetVariantUseCaseableGeneratedMock
    let getTintedUseCase: ButtonGetVariantUseCaseableGeneratedMock
    let getAppearanceUseCase: ButtonGetAppearanceUseCaseableGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.getContrastUseCase = .init()
        self.getFilledUseCase = .init()
        self.getGhostUseCase = .init()
        self.getOutlinedUseCase = .init()
        self.getTintedUseCase = .init()
        self.getAppearanceUseCase = .init()
        self.sut = ButtonGetColorsUseCase(
            getContrastUseCase: self.getContrastUseCase,
            getFilledUseCase: self.getFilledUseCase,
            getGhostUseCase: self.getGhostUseCase,
            getOutlinedUseCase: self.getOutlinedUseCase,
            getTintedUseCase: self.getTintedUseCase,
            getAppearanceUseCase: self.getAppearanceUseCase
        )
    }

    // MARK: - Tests

    // MARK: Deprecated execute with appearance parameter

    @Test("Deprecated execute with appearance uses new execute")
    func deprecatedExecuteWithAppearanceUsesNewExecute() throws {
        // GIVEN
        self.getAppearanceUseCase.executeWithAppearanceAndIntentAndVariantReturnValue = .primary

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .primary,
            intent: .main,
            variant: .filled,
            isPressed: false
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.main.onMain))
        #expect(colors.backgroundColor.equals(self.theme.colors.main.main))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
        ButtonGetAppearanceUseCaseableMockTest.expect(
            self.getAppearanceUseCase,
            expectedNumberOfCalls: 1,
            givenAppearance: .primary,
            givenIntent: .main,
            givenVariant: .filled,
            expectedReturnValue: .primary
        )
    }

    @Test(
        "Deprecated execute with nil appearance and variants",
        arguments: [
            (ButtonVariant.contrast, "getContrastUseCase"),
            (ButtonVariant.filled, "getFilledUseCase"),
            (ButtonVariant.ghost, "getGhostUseCase"),
            (ButtonVariant.outlined, "getOutlinedUseCase"),
            (ButtonVariant.tinted, "getTintedUseCase")
        ]
    )
    func deprecatedExecuteWithNilAppearanceAndVariants(variant: ButtonVariant, useCaseName: String) throws {
        // GIVEN
        self.getAppearanceUseCase.executeWithAppearanceAndIntentAndVariantReturnValue = nil

        let expectedColors = ButtonColors(
            tintColor: self.theme.colors.accent.accent,
            backgroundColor: ColorTokenDefault.clear,
            borderColor: self.theme.colors.accent.accent
        )

        switch variant {
        case .contrast:
            self.getContrastUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = expectedColors
        case .filled:
            self.getFilledUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = expectedColors
        case .ghost:
            self.getGhostUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = expectedColors
        case .outlined:
            self.getOutlinedUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = expectedColors
        case .tinted:
            self.getTintedUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = expectedColors
        }

        let useCase = switch variant {
        case .contrast: self.getContrastUseCase
        case .filled: self.getFilledUseCase
        case .ghost: self.getGhostUseCase
        case .outlined: self.getOutlinedUseCase
        case .tinted: self.getTintedUseCase
        }

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: nil,
            intent: .main,
            variant: variant,
            isPressed: false
        )

        // THEN
        #expect(colors == expectedColors)
        ButtonGetAppearanceUseCaseableMockTest.expect(
            self.getAppearanceUseCase,
            expectedNumberOfCalls: 1,
            givenIntent: .main,
            givenVariant: variant,
            expectedReturnValue: nil
        )

        // Verify the correct variant use case was called
        ButtonGetVariantUseCaseableMockTest.expect(
            useCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: .main,
            givenIsPressed: false,
            expectedReturnValue: expectedColors
        )
    }

    // MARK: New execute with appearance parameter

    @Test("Execute with primary appearance not pressed")
    func executeWithPrimaryAppearanceNotPressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .primary,
            isPressed: false
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.main.onMain))
        #expect(colors.backgroundColor.equals(self.theme.colors.main.main))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Execute with primary appearance pressed")
    func executeWithPrimaryAppearancePressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .primary,
            isPressed: true
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.main.onMain))
        #expect(colors.backgroundColor.equals(self.theme.colors.states.mainPressed))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Execute with secondary appearance not pressed")
    func executeWithSecondaryAppearanceNotPressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .secondary,
            isPressed: false
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.support.onSupport))
        #expect(colors.backgroundColor.equals(self.theme.colors.support.support))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Execute with secondary appearance pressed")
    func executeWithSecondaryAppearancePressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .secondary,
            isPressed: true
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.support.onSupport))
        #expect(colors.backgroundColor.equals(self.theme.colors.states.supportPressed))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Execute with tertiary appearance not pressed")
    func executeWithTertiaryAppearanceNotPressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .tertiary,
            isPressed: false
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.base.onSurface))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.base.outline))
    }

    @Test("Execute with tertiary appearance pressed")
    func executeWithTertiaryAppearancePressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .tertiary,
            isPressed: true
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.base.onSurface))
        #expect(colors.backgroundColor.equals(self.theme.colors.states.surfacePressed))
        #expect(colors.borderColor.equals(self.theme.colors.base.outline))
    }

    @Test("Execute with contrast appearance not pressed")
    func executeWithContrastAppearanceNotPressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .contrast,
            isPressed: false
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.base.onSurface))
        #expect(colors.backgroundColor.equals(self.theme.colors.base.surface))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Execute with contrast appearance pressed")
    func executeWithContrastAppearancePressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .contrast,
            isPressed: true
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.base.onSurface))
        #expect(colors.backgroundColor.equals(self.theme.colors.states.surfacePressed))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Execute with ghost appearance not pressed")
    func executeWithGhostAppearanceNotPressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .ghost,
            isPressed: false
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.base.onSurface))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Execute with ghost appearance pressed")
    func executeWithGhostAppearancePressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .ghost,
            isPressed: true
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.base.onSurface))
        #expect(colors.backgroundColor.equals(self.theme.colors.states.surfacePressed))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Execute with success appearance not pressed")
    func executeWithSuccessAppearanceNotPressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .success,
            isPressed: false
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.success))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.base.outline))
    }

    @Test("Execute with success appearance pressed")
    func executeWithSuccessAppearancePressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .success,
            isPressed: true
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.success))
        #expect(colors.backgroundColor.equals(self.theme.colors.states.successPressed.opacity(self.theme.dims.dim5)))
        #expect(colors.borderColor.equals(self.theme.colors.base.outline))
    }

    @Test("Execute with danger appearance not pressed")
    func executeWithDangerAppearanceNotPressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .danger,
            isPressed: false
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.error))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.base.outline))
    }

    @Test("Execute with danger appearance pressed")
    func executeWithDangerAppearancePressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .danger,
            isPressed: true
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.error))
        #expect(colors.backgroundColor.equals(self.theme.colors.states.errorPressed.opacity(self.theme.dims.dim5)))
        #expect(colors.borderColor.equals(self.theme.colors.base.outline))
    }

    @Test("Execute with boost appearance not pressed")
    func executeWithBoostAppearanceNotPressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .boost,
            isPressed: false
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.accent.onAccent))
        #expect(colors.backgroundColor.equals(self.theme.colors.accent.accent))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Execute with boost appearance pressed")
    func executeWithBoostAppearancePressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .boost,
            isPressed: true
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.accent.onAccent))
        #expect(colors.backgroundColor.equals(self.theme.colors.states.accentPressed))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Execute with AI appearance not pressed")
    func executeWithAIAppearanceNotPressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .ai,
            isPressed: false
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.ai.onAIContainer))
        #expect(colors.iconColor.equals(self.theme.colors.ai.ai))
        #expect(colors.backgroundColor.equals(self.theme.colors.ai.aiContainer))
        #expect(colors.borderColor.equals(self.theme.colors.ai.ai))
    }

    @Test("Execute with AI appearance pressed")
    func executeWithAIAppearancePressed() throws {
        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            appearance: .ai,
            isPressed: true
        )

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.ai.onAIContainer))
        #expect(colors.iconColor.equals(self.theme.colors.ai.ai))
        #expect(colors.backgroundColor.equals(self.theme.colors.states.aiContainerPressed))
        #expect(colors.borderColor.equals(self.theme.colors.ai.ai))
    }
}
