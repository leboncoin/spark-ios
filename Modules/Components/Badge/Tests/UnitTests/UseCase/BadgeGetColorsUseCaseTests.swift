//
//  BadgeGetColorsUseCaseTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Badge Get Colors UseCase Tests")
struct BadgeGetColorsUseCaseTests {

    // MARK: - Properties

    private let sut: BadgeGetColorsUseCase
    private let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.sut = BadgeGetColorsUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    @Test("Execute with accent intent")
    func executeWithAccentIntent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .accent)

        let expectedColors = BadgeColors(
            background: self.theme.colors.accent.accent,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.accent.onAccent
        )

        // THEN
        #expect(result == expectedColors)
    }

    @Test("Execute with alert intent")
    func executeWithAlertIntent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .alert)

        let expectedColors = BadgeColors(
            background: self.theme.colors.feedback.alert,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.feedback.onAlert
        )

        // THEN
        #expect(result == expectedColors)
    }

    @Test("Execute with danger intent")
    func executeWithDangerIntent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .danger)

        let expectedColors = BadgeColors(
            background: self.theme.colors.feedback.error,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.feedback.onError
        )

        // THEN
        #expect(result == expectedColors)
    }

    @Test("Execute with info intent")
    func executeWithInfoIntent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .info)

        let expectedColors = BadgeColors(
            background: self.theme.colors.feedback.info,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.feedback.onInfo
        )

        // THEN
        #expect(result == expectedColors)
    }

    @Test("Execute with neutral intent")
    func executeWithNeutralIntent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .neutral)

        let expectedColors = BadgeColors(
            background: self.theme.colors.feedback.neutral,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.feedback.onNeutral
        )

        // THEN
        #expect(result == expectedColors)
    }

    @Test("Execute with main intent")
    func executeWithMainIntent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .main)

        let expectedColors = BadgeColors(
            background: self.theme.colors.main.main,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.main.onMain
        )

        // THEN
        #expect(result == expectedColors)
    }

    @Test("Execute with support intent")
    func executeWithSupportIntent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .support)

        let expectedColors = BadgeColors(
            background: self.theme.colors.support.support,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.support.onSupport
        )

        // THEN
        #expect(result == expectedColors)
    }

    @Test("Execute with success intent")
    func executeWithSuccessIntent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .success)

        let expectedColors = BadgeColors(
            background: self.theme.colors.feedback.success,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.feedback.onSuccess
        )

        // THEN
        #expect(result == expectedColors)
    }
}