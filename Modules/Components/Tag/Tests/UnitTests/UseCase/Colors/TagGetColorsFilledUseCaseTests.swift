//
//  TagGetColorsFilledUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 26/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkThemingTesting

struct TagGetColorsFilledUseCaseTests {

    // MARK: - Properties

    private let useCase = TagGetColorsFilledUseCase()
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
        #expect(sut.backgroundColor.equals(self.theme.colors.accent.accent))
        #expect(sut.borderColor.equals(self.theme.colors.accent.accent))
        #expect(sut.iconColor.equals(self.theme.colors.accent.onAccent))
        #expect(sut.textColor.equals(self.theme.colors.accent.onAccent))
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
        #expect(sut.backgroundColor.equals(self.theme.colors.feedback.alert))
        #expect(sut.borderColor.equals(self.theme.colors.feedback.alert))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.onAlert))
        #expect(sut.textColor.equals(self.theme.colors.feedback.onAlert))
    }

    @Test
    func test_execute_intent_danger() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .danger
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.feedback.error))
        #expect(sut.borderColor.equals(self.theme.colors.feedback.error))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.onError))
        #expect(sut.textColor.equals(self.theme.colors.feedback.onError))
    }

    @Test
    func test_execute_intent_info() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .info
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.feedback.info))
        #expect(sut.borderColor.equals(self.theme.colors.feedback.info))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.onInfo))
        #expect(sut.textColor.equals(self.theme.colors.feedback.onInfo))
    }

    @Test
    func test_execute_intent_main() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .main
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.main.main))
        #expect(sut.borderColor.equals(self.theme.colors.main.main))
        #expect(sut.iconColor.equals(self.theme.colors.main.onMain))
        #expect(sut.textColor.equals(self.theme.colors.main.onMain))
    }

    @Test
    func test_execute_intent_neutral() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .neutral
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.feedback.neutral))
        #expect(sut.borderColor.equals(self.theme.colors.feedback.neutral))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.onNeutral))
        #expect(sut.textColor.equals(self.theme.colors.feedback.onNeutral))
    }

    @Test
    func test_execute_intent_success() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .success
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.feedback.success))
        #expect(sut.borderColor.equals(self.theme.colors.feedback.success))
        #expect(sut.iconColor.equals(self.theme.colors.feedback.onSuccess))
        #expect(sut.textColor.equals(self.theme.colors.feedback.onSuccess))
    }

    @Test
    func test_execute_intent_support() {
        // GIVEN / WHEN
        let sut = self.useCase.execute(
            theme: self.theme,
            intent: .support
        )

        // THEN
        #expect(sut.backgroundColor.equals(self.theme.colors.support.support))
        #expect(sut.borderColor.equals(self.theme.colors.support.support))
        #expect(sut.iconColor.equals(self.theme.colors.support.onSupport))
        #expect(sut.textColor.equals(self.theme.colors.support.onSupport))
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
