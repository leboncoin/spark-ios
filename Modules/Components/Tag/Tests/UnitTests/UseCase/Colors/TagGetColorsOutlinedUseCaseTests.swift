//
//  TagGetColorsOutlinedUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 26/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkThemingTesting

struct TagGetColorsOutlinedUseCaseTests {

    // MARK: - Properties

    private let useCase = TagGetColorsOutlinedUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute intent accent")
    func test_execute_intent_accent() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .accent
        )

        // THEN
        #expect(sut.backgroundColor.isClear)
        #expect(sut.borderColor.equals(self.theme.colors.accent.accent))
        #expect(sut.iconColor.equals(self.theme.colors.accent.accent))
        #expect(sut.textColor.equals(self.theme.colors.accent.accent))
    }

    @Test("Execute intent ai")
    func test_execute_intent_ai() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .ai
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.ai.aiContainer))
        #expect(sut.borderColor.equals(self.theme.colors.ai.ai))
        #expect(sut.iconColor.equals(self.theme.colors.ai.ai))
        #expect(sut.textColor.equals(self.theme.colors.ai.onAIContainer))
    }

    @Test("Execute intent alert")
    func test_execute_intent_alert() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .alert
        )

        // THEN
        #expect(sut.backgroundColor.isClear)
        #expect(sut.borderColor.equals(self.theme.colors.feedback.alert))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.alert))
        #expect(sut.textColor.equals(self.theme.colors.feedback.alert))
    }

    @Test("Execute intent danger")
    func test_execute_intent_danger() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .danger
        )

        // THEN
        #expect(sut.backgroundColor.isClear)
        #expect(sut.borderColor.equals(self.theme.colors.feedback.error))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.error))
        #expect(sut.textColor.equals(self.theme.colors.feedback.error))
    }

    @Test("Execute intent info")
    func test_execute_intent_info() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .info
        )

        // THEN
        #expect(sut.backgroundColor.isClear)
        #expect(sut.borderColor.equals(self.theme.colors.feedback.info))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.info))
        #expect(sut.textColor.equals(self.theme.colors.feedback.info))
    }

    @Test("Execute intent main")
    func test_execute_intent_main() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .main
        )

        // THEN
        #expect(sut.backgroundColor.isClear)
        #expect(sut.borderColor.equals(self.theme.colors.main.main))
        #expect(sut.iconColor.equals(self.theme.colors.main.main))
        #expect(sut.textColor.equals(self.theme.colors.main.main))
    }

    @Test("Execute intent neutral")
    func test_execute_intent_neutral() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .neutral
        )

        // THEN
        #expect(sut.backgroundColor.isClear)
        #expect(sut.borderColor.equals(self.theme.colors.feedback.neutral))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.neutral))
        #expect(sut.textColor.equals(self.theme.colors.feedback.neutral))
    }

    @Test("Execute intent success")
    func test_execute_intent_success() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .success
        )

        // THEN
        #expect(sut.backgroundColor.isClear)
        #expect(sut.borderColor.equals(self.theme.colors.feedback.success))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.success))
        #expect(sut.textColor.equals(self.theme.colors.feedback.success))
    }

    @Test("Execute intent support")
    func test_execute_intent_support() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .support
        )

        // THEN
        #expect(sut.backgroundColor.isClear)
        #expect(sut.borderColor.equals(self.theme.colors.support.support))
        #expect(sut.iconColor.equals(self.theme.colors.support.support))
        #expect(sut.textColor.equals(self.theme.colors.support.support))
    }

    @Test("Execute intent surface")
    func test_execute_intent_surface() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .surface
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.base.surface))
        #expect(sut.borderColor.equals(self.theme.colors.base.surface))
        #expect(sut.iconColor.equals(self.theme.colors.base.onSurface))
        #expect(sut.textColor.equals(self.theme.colors.base.onSurface))
    }
}
