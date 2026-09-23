//
//  ButtonGetVariantOutlinedUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Variant Outlined Use Case Tests")
struct ButtonGetVariantOutlinedUseCaseTests {

    // MARK: - Properties

    let sut: ButtonGetVariantOutlinedUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = ButtonGetVariantOutlinedUseCase()
    }

    // MARK: - Tests

    @Test("Intent accent")
    func intentAccent() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .accent, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.accent.accent))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.accent.accent))
    }

    @Test("Intent ai")
    func intentAI() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .ai, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.ai.ai))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.ai.ai))
    }

    @Test("Intent alert")
    func intentAlert() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .alert, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.alert))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.feedback.alert))
    }

    @Test("Intent danger")
    func intentDanger() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .danger, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.error))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.feedback.error))
    }

    @Test("Intent info")
    func intentInfo() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .info, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.info))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.feedback.info))
    }

    @Test("Intent main")
    func intentMain() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .main, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.main.main))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.main.main))
    }

    @Test("Intent neutral")
    func intentNeutral() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .neutral, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.neutral))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.feedback.neutral))
    }

    @Test("Intent success")
    func intentSuccess() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .success, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.feedback.success))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.feedback.success))
    }

    @Test("Intent support")
    func intentSupport() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .support, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.support.support))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.support.support))
    }

    @Test("Intent surface")
    func intentSurface() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .surface, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.base.surface))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.base.surface))
    }

    @Test("Intent surfaceInverse")
    func intentSurfaceInverse() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .surfaceInverse, isPressed: false)

        // THEN
        #expect(colors.tintColor.equals(self.theme.colors.base.surfaceInverse))
        #expect(colors.backgroundColor.equals(ColorTokenDefault.clear))
        #expect(colors.borderColor.equals(self.theme.colors.base.surfaceInverse))
    }
}
