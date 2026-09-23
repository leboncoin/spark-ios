//
//  TextLinkGetColorUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink

final class TextLinkGetColorUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = TextLinkGetColorUseCase()

    // MARK: - Tests

    func test_execute_accent_not_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.accent
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.accent.accent))
    }

    func test_execute_accent_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.accent
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.states.accentPressed))
    }

    func test_execute_alert_not_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.alert
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.feedback.alert))
    }

    func test_execute_alert_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.alert
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.states.alertPressed))
    }

    func test_execute_support_not_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.support
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.support.support))
    }

    func test_execute_support_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.support
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.states.supportPressed))
    }

    func test_execute_danger_not_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.danger
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.feedback.error))
    }

    func test_execute_danger_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.danger
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.states.errorPressed))
    }

    func test_execute_info_not_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.info
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.feedback.info))
    }

    func test_execute_info_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.info
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.states.infoPressed))
    }

    func test_execute_main_not_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.main
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.main.main))
    }

    func test_execute_main_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.main
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.states.mainPressed))
    }

    func test_execute_neutral_not_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.neutral
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.feedback.neutral))
    }

    func test_execute_neutral_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.neutral
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.states.neutralPressed))
    }

    func test_execute_success_not_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.success
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.feedback.success))
    }

    func test_execute_success_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.success
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.states.successPressed))
    }

    func test_execute_custom() {
        // GIVEN
        let customColorToken = ColorTokenGeneratedMock.red()
        let intent = TextLinkIntent.custom(customColorToken)
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(customColorToken))
    }

    func test_execute_custom_highlighted() {
        // GIVEN
        let customColorToken = ColorTokenGeneratedMock.red()
        let intent = TextLinkIntent.custom(customColorToken)
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(customColorToken))
    }

    // MARK: - Deprecated Tests

    func test_execute_deprecated_accent_container() {
        // GIVEN
        let intent = TextLinkIntent.accentContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.accent.onAccentContainer))
    }

    func test_execute_deprecated_surface() {
        // GIVEN
        let intent = TextLinkIntent.surface
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.base.onSurface))
    }

    func test_execute_deprecated_alert_container() {
        // GIVEN
        let intent = TextLinkIntent.alertContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.feedback.onAlertContainer))
    }

    func test_execute_deprecated_support_container() {
        // GIVEN
        let intent = TextLinkIntent.supportContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.support.onSupportContainer))
    }

    func test_execute_deprecated_danger_container() {
        // GIVEN
        let intent = TextLinkIntent.dangerContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.feedback.onErrorContainer))
    }

    func test_execute_deprecated_info_container() {
        // GIVEN
        let intent = TextLinkIntent.infoContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.feedback.onInfoContainer))
    }

    func test_execute_deprecated_main_container() {
        // GIVEN
        let intent = TextLinkIntent.mainContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.main.onMainContainer))
    }

    func test_execute_deprecated_neutral_container() {
        // GIVEN
        let intent = TextLinkIntent.neutralContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.feedback.onNeutralContainer))
    }

    func test_execute_deprecated_on_accent_container() {
        // GIVEN
        let intent = TextLinkIntent.onAccentContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.accent.onAccentContainer))
    }

    func test_execute_deprecated_on_surface() {
        // GIVEN
        let intent = TextLinkIntent.onSurface
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.base.onSurface))
    }

    func test_execute_deprecated_success_container() {
        // GIVEN
        let intent = TextLinkIntent.successContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertTrue(result.equals(theme.colors.feedback.onSuccessContainer))
    }
}
