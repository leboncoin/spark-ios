//
//  TextLinkGetDimUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink

final class TextLinkGetDimUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = TextLinkGetDimUseCase()

    // MARK: - Tests

    func test_execute_support_intent_not_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_support_intent_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_accent_intent_not_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_custom_intent_not_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_custom_intent_highlighted() {
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
        XCTAssertEqual(result, theme.dims.dim1)
    }

    // MARK: - Deprecated Tests

    func test_execute_accent_container_not_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_accent_container_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.accentContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, theme.dims.dim1)
    }

    func test_execute_on_accent_container_not_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_on_accent_container_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.onAccentContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, theme.dims.dim1)
    }

    func test_execute_alert_container_not_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_alert_container_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.alertContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, theme.dims.dim1)
    }

    func test_execute_support_container_not_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_support_container_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.supportContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, theme.dims.dim1)
    }

    func test_execute_danger_container_not_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_danger_container_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.dangerContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, theme.dims.dim1)
    }

    func test_execute_info_container_not_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_info_container_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.infoContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, theme.dims.dim1)
    }

    func test_execute_main_container_not_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_main_container_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.mainContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, theme.dims.dim1)
    }

    func test_execute_neutral_container_not_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_neutral_container_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.neutralContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, theme.dims.dim1)
    }

    func test_execute_success_container_not_highlighted() {
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
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_success_container_highlighted() {
        // GIVEN
        let intent = TextLinkIntent.successContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        XCTAssertEqual(result, theme.dims.dim1)
    }
}
