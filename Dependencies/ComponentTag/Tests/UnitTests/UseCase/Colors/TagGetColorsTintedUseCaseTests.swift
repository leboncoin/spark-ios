//
//  TagGetColorsTintedUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 26/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkThemingTesting

struct TagGetColorsTintedUseCaseTests {

    // MARK: - Properties

    private let useCase = TagGetColorsTintedUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func test_execute_intent_accent() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .accent
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.accent.accentContainer))
        #expect(sut.borderColor.equals(self.theme.colors.accent.accentContainer))
        #expect(sut.iconColor.equals(self.theme.colors.accent.onAccentContainer))
        #expect(sut.textColor.equals(self.theme.colors.accent.onAccentContainer))
    }

    @Test
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

    @Test
    func test_execute_intent_alert() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .alert
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.feedback.alertContainer))
        #expect(sut.borderColor.equals(self.theme.colors.feedback.alertContainer))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.onAlertContainer))
        #expect(sut.textColor.equals(self.theme.colors.feedback.onAlertContainer))
    }

    @Test
    func test_execute_intent_danger() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .danger
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.feedback.errorContainer))
        #expect(sut.borderColor.equals(self.theme.colors.feedback.errorContainer))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.onErrorContainer))
        #expect(sut.textColor.equals(self.theme.colors.feedback.onErrorContainer))
    }

    @Test
    func test_execute_intent_info() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .info
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.feedback.infoContainer))
        #expect(sut.borderColor.equals(self.theme.colors.feedback.infoContainer))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.onInfoContainer))
        #expect(sut.textColor.equals(self.theme.colors.feedback.onInfoContainer))
    }

    @Test
    func test_execute_intent_main() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .main
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.main.mainContainer))
        #expect(sut.borderColor.equals(self.theme.colors.main.mainContainer))
        #expect(sut.iconColor.equals(self.theme.colors.main.onMainContainer))
        #expect(sut.textColor.equals(self.theme.colors.main.onMainContainer))
    }

    @Test
    func test_execute_intent_neutral() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .neutral
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.feedback.neutralContainer))
        #expect(sut.borderColor.equals(self.theme.colors.feedback.neutralContainer))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.onNeutralContainer))
        #expect(sut.textColor.equals(self.theme.colors.feedback.onNeutralContainer))
    }

    @Test
    func test_execute_intent_success() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .success
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.feedback.successContainer))
        #expect(sut.borderColor.equals(self.theme.colors.feedback.successContainer))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.onSuccessContainer))
        #expect(sut.textColor.equals(self.theme.colors.feedback.onSuccessContainer))
    }

    @Test
    func test_execute_intent_support() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .support
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.support.supportContainer))
        #expect(sut.borderColor.equals(self.theme.colors.support.supportContainer))
        #expect(sut.iconColor.equals(self.theme.colors.support.onSupportContainer))
        #expect(sut.textColor.equals(self.theme.colors.support.onSupportContainer))
    }

    @Test
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
