//
//  ChipGetStateTintedColorsUseCaseTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ChipGetStateTintedColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: ChipGetStateTintedColorsUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = ChipGetStateTintedColorsUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_with_accent_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .accent)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.accent.accentContainer,
            pressedBorder: self.theme.colors.states.accentContainerPressed,
            selectedBorder: self.theme.colors.accent.accent,
            content: self.theme.colors.accent.onAccentContainer,
            selectedContent: self.theme.colors.accent.onAccent,
            background: self.theme.colors.accent.accentContainer,
            pressedBackground: self.theme.colors.states.accentContainerPressed,
            selectedBackground: self.theme.colors.accent.accent
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_alert_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .alert)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.feedback.alertContainer,
            pressedBorder: self.theme.colors.states.alertContainerPressed,
            selectedBorder: self.theme.colors.feedback.alert,
            content: self.theme.colors.feedback.onAlertContainer,
            selectedContent: self.theme.colors.feedback.onAlert,
            background: self.theme.colors.feedback.alertContainer,
            pressedBackground: self.theme.colors.states.alertContainerPressed,
            selectedBackground: self.theme.colors.feedback.alert
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_danger_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .danger)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.feedback.errorContainer,
            pressedBorder: self.theme.colors.states.errorContainerPressed,
            selectedBorder: self.theme.colors.feedback.error,
            content: self.theme.colors.feedback.onErrorContainer,
            selectedContent: self.theme.colors.feedback.onError,
            background: self.theme.colors.feedback.errorContainer,
            pressedBackground: self.theme.colors.states.errorContainerPressed,
            selectedBackground: self.theme.colors.feedback.error
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_info_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .info)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.feedback.infoContainer,
            pressedBorder: self.theme.colors.states.infoContainerPressed,
            selectedBorder: self.theme.colors.feedback.info,
            content: self.theme.colors.feedback.onInfoContainer,
            selectedContent: self.theme.colors.feedback.onInfo,
            background: self.theme.colors.feedback.infoContainer,
            pressedBackground: self.theme.colors.states.infoContainerPressed,
            selectedBackground: self.theme.colors.feedback.info
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_main_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .main)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.main.mainContainer,
            pressedBorder: self.theme.colors.states.mainContainerPressed,
            selectedBorder: self.theme.colors.main.main,
            content: self.theme.colors.main.onMainContainer,
            selectedContent: self.theme.colors.main.onMain,
            background: self.theme.colors.main.mainContainer,
            pressedBackground: self.theme.colors.states.mainContainerPressed,
            selectedBackground: self.theme.colors.main.main
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_neutral_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .neutral)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.feedback.neutralContainer,
            pressedBorder: self.theme.colors.states.neutralContainerPressed,
            selectedBorder: self.theme.colors.feedback.neutral,
            content: self.theme.colors.feedback.onNeutralContainer,
            selectedContent: self.theme.colors.feedback.onNeutral,
            background: self.theme.colors.feedback.neutralContainer,
            pressedBackground: self.theme.colors.states.neutralContainerPressed,
            selectedBackground: self.theme.colors.feedback.neutral
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_support_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .support)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.support.supportContainer,
            pressedBorder: self.theme.colors.states.supportContainerPressed,
            selectedBorder: self.theme.colors.support.support,
            content: self.theme.colors.support.onSupportContainer,
            selectedContent: self.theme.colors.support.onSupport,
            background: self.theme.colors.support.supportContainer,
            pressedBackground: self.theme.colors.states.supportContainerPressed,
            selectedBackground: self.theme.colors.support.support
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_surface_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .surface)

        let expectedColors = ChipStateColors(
            border: ColorTokenDefault.clear,
            pressedBorder: self.theme.colors.states.surfacePressed,
            selectedBorder: self.theme.colors.base.surface,
            content: self.theme.colors.base.surfaceInverse,
            selectedContent: self.theme.colors.base.onSurface,
            background: self.theme.colors.base.surface.opacity(self.theme.dims.dim1),
            pressedBackground: self.theme.colors.states.surfacePressed,
            selectedBackground: self.theme.colors.base.surface
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_success_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .success)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.feedback.successContainer,
            pressedBorder: self.theme.colors.states.successContainerPressed,
            selectedBorder: self.theme.colors.feedback.success,
            content: self.theme.colors.feedback.onSuccessContainer,
            selectedContent: self.theme.colors.feedback.onSuccess,
            background: self.theme.colors.feedback.successContainer,
            pressedBackground: self.theme.colors.states.successContainerPressed,
            selectedBackground: self.theme.colors.feedback.success
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }
}
