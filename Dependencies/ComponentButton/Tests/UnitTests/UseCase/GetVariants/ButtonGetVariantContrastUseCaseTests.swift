//
//  ButtonGetVariantContrastUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Variant Contrast Use Case Tests")
struct ButtonGetVariantContrastUseCaseTests {

    // MARK: - Properties

    let sut: ButtonVariantGetContrastUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = ButtonVariantGetContrastUseCase()
    }

    // MARK: - Tests

    @Test("Intent accent")
    func intentAccent() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .accent, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.accent.onAccentContainer))
        #expect(colors.backgroundColor.equals(self.theme.colors.base.surface))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent ai")
    func intentAI() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .ai, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.ai.onAIContainer))
        #expect(colors.backgroundColor.equals(self.theme.colors.base.surface))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent alert")
    func intentAlert() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .alert, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.onAlertContainer))
        #expect(colors.backgroundColor.equals(self.theme.colors.base.surface))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent danger")
    func intentDanger() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .danger, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.onErrorContainer))
        #expect(colors.backgroundColor.equals(self.theme.colors.base.surface))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent info")
    func intentInfo() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .info, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.onInfoContainer))
        #expect(colors.backgroundColor.equals(self.theme.colors.base.surface))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent main")
    func intentMain() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .main, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.main.onMainContainer))
        #expect(colors.backgroundColor.equals(self.theme.colors.base.surface))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent neutral")
    func intentNeutral() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .neutral, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.onNeutralContainer))
        #expect(colors.backgroundColor.equals(self.theme.colors.base.surface))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent success")
    func intentSuccess() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .success, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.onSuccessContainer))
        #expect(colors.backgroundColor.equals(self.theme.colors.base.surface))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent support")
    func intentSupport() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .support, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.support.onSupportContainer))
        #expect(colors.backgroundColor.equals(self.theme.colors.base.surface))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent surface")
    func intentSurface() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .surface, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.base.onSurface))
        #expect(colors.backgroundColor.equals(self.theme.colors.base.surface))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }

    @Test("Intent surfaceInverse")
    func intentSurfaceInverse() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .surfaceInverse, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.base.onSurfaceInverse))
        #expect(colors.backgroundColor.equals(self.theme.colors.base.surfaceInverse))
        #expect(colors.borderColor.equals(ColorTokenDefault.clear))
    }
}
