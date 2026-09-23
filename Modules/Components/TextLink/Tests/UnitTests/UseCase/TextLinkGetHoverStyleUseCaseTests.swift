//
//  TextLinkGetHoverStyleUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink

final class TextLinkGetHoverStyleUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = TextLinkGetHoverStyleUseCase()

    // MARK: - Tests

    func test_execute_accent_intent() {
        // GIVEN
        let intent = TextLinkIntent.accent

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.accent.accent))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_alert_intent() {
        // GIVEN
        let intent = TextLinkIntent.alert

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.feedback.alert))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_support_intent() {
        // GIVEN
        let intent = TextLinkIntent.support

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.support.support))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_danger_intent() {
        // GIVEN
        let intent = TextLinkIntent.danger

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.feedback.error))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_info_intent() {
        // GIVEN
        let intent = TextLinkIntent.info

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.feedback.info))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_main_intent() {
        // GIVEN
        let intent = TextLinkIntent.main

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.main.main))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_neutral_intent() {
        // GIVEN
        let intent = TextLinkIntent.neutral

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.feedback.neutral))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_success_intent() {
        // GIVEN
        let intent = TextLinkIntent.success

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.feedback.success))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_custom_intent() {
        // GIVEN
        let customColorToken = ColorTokenGeneratedMock.red()
        let intent = TextLinkIntent.custom(customColorToken)

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(customColorToken))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    // MARK: - Deprecated Tests

    func test_execute_accent_container_intent() {
        // GIVEN
        let intent = TextLinkIntent.accentContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.accent.accent))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_alert_container_intent() {
        // GIVEN
        let intent = TextLinkIntent.alertContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.feedback.alert))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_support_container_intent() {
        // GIVEN
        let intent = TextLinkIntent.supportContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.support.support))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_danger_container_intent() {
        // GIVEN
        let intent = TextLinkIntent.dangerContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.feedback.error))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_info_container_intent() {
        // GIVEN
        let intent = TextLinkIntent.infoContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.feedback.info))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_main_container_intent() {
        // GIVEN
        let intent = TextLinkIntent.mainContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.main.main))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_neutral_container_intent() {
        // GIVEN
        let intent = TextLinkIntent.neutralContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.feedback.neutral))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_on_accent_container_intent() {
        // GIVEN
        let intent = TextLinkIntent.onAccentContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.accent.accent))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_on_surface_intent() {
        // GIVEN
        let intent = TextLinkIntent.onSurface

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.base.surface))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_success_container_intent() {
        // GIVEN
        let intent = TextLinkIntent.successContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.feedback.success))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }

    func test_execute_surface_intent() {
        // GIVEN
        let intent = TextLinkIntent.surface

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertEqual(result.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(result.verticalPadding, theme.layout.spacing.small)
        XCTAssertEqual(result.cornerRadius, theme.border.radius.medium)
        XCTAssertTrue(result.backgroundColor.equals(theme.colors.base.surface))
        XCTAssertEqual(result.dim, theme.dims.dim5)
    }
}
