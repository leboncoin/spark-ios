//
//  BadgeGetColorsUseCaseTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class BadgeGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: BadgeGetColorsUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = BadgeGetColorsUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_with_accent_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .accent)

        let expectedColors = BadgeColors(
            background: self.theme.colors.accent.accent,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.accent.onAccent
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_alert_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .alert)

        let expectedColors = BadgeColors(
            background: self.theme.colors.feedback.alert,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.feedback.onAlert
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_danger_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .danger)

        let expectedColors = BadgeColors(
            background: self.theme.colors.feedback.error,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.feedback.onError
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_info_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .info)

        let expectedColors = BadgeColors(
            background: self.theme.colors.feedback.info,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.feedback.onInfo
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_neutral_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .neutral)

        let expectedColors = BadgeColors(
            background: self.theme.colors.feedback.neutral,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.feedback.onNeutral
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_main_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .main)

        let expectedColors = BadgeColors(
            background: self.theme.colors.main.main,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.main.onMain
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_support_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .support)

        let expectedColors = BadgeColors(
            background: self.theme.colors.support.support,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.support.onSupport
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_success_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .success)

        let expectedColors = BadgeColors(
            background: self.theme.colors.feedback.success,
            border: self.theme.colors.base.surface,
            foreground: self.theme.colors.feedback.onSuccess
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }
}