//
//  ChipGetStateOutlinedColorsUseCaseTests.swift
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

final class ChipGetStateOutlinedColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: ChipGetStateOutlinedColorsUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = ChipGetStateOutlinedColorsUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_with_accent_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .accent)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.accent.accent,
            pressedBorder: self.theme.colors.accent.accent,
            selectedBorder: self.theme.colors.accent.accent,
            content: self.theme.colors.accent.accent,
            selectedContent: self.theme.colors.accent.accent,
            background: ColorTokenDefault.clear,
            pressedBackground: self.theme.colors.accent.accent.opacity(self.theme.dims.dim5),
            selectedBackground: self.theme.colors.accent.accentContainer
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_alert_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .alert)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.feedback.alert,
            pressedBorder: self.theme.colors.feedback.alert,
            selectedBorder: self.theme.colors.feedback.alert,
            content: self.theme.colors.feedback.alert,
            selectedContent: self.theme.colors.feedback.alert,
            background: ColorTokenDefault.clear,
            pressedBackground: self.theme.colors.feedback.alert.opacity(self.theme.dims.dim5),
            selectedBackground: self.theme.colors.feedback.alertContainer
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_danger_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .danger)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.feedback.error,
            pressedBorder: self.theme.colors.feedback.error,
            selectedBorder: self.theme.colors.feedback.error,
            content: self.theme.colors.feedback.error,
            selectedContent: self.theme.colors.feedback.error,
            background: ColorTokenDefault.clear,
            pressedBackground: self.theme.colors.feedback.error.opacity(self.theme.dims.dim5),
            selectedBackground: self.theme.colors.feedback.errorContainer
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_info_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .info)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.feedback.info,
            pressedBorder: self.theme.colors.feedback.info,
            selectedBorder: self.theme.colors.feedback.info,
            content: self.theme.colors.feedback.info,
            selectedContent: self.theme.colors.feedback.info,
            background: ColorTokenDefault.clear,
            pressedBackground: self.theme.colors.feedback.info.opacity(self.theme.dims.dim5),
            selectedBackground: self.theme.colors.feedback.infoContainer
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_main_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .main)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.main.main,
            pressedBorder: self.theme.colors.main.main,
            selectedBorder: self.theme.colors.main.main,
            content: self.theme.colors.main.main,
            selectedContent: self.theme.colors.main.main,
            background: ColorTokenDefault.clear,
            pressedBackground: self.theme.colors.main.main.opacity(self.theme.dims.dim5),
            selectedBackground: self.theme.colors.main.mainContainer
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_neutral_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .neutral)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.feedback.neutral,
            pressedBorder: self.theme.colors.feedback.neutral,
            selectedBorder: self.theme.colors.feedback.neutral,
            content: self.theme.colors.feedback.neutral,
            selectedContent: self.theme.colors.feedback.neutral,
            background: ColorTokenDefault.clear,
            pressedBackground: self.theme.colors.feedback.neutral.opacity(self.theme.dims.dim5),
            selectedBackground: self.theme.colors.feedback.neutralContainer
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_success_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .success)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.feedback.success,
            pressedBorder: self.theme.colors.feedback.success,
            selectedBorder: self.theme.colors.feedback.success,
            content: self.theme.colors.feedback.success,
            selectedContent: self.theme.colors.feedback.success,
            background: ColorTokenDefault.clear,
            pressedBackground: self.theme.colors.feedback.success.opacity(self.theme.dims.dim5),
            selectedBackground: self.theme.colors.feedback.successContainer
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_support_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .support)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.support.support,
            pressedBorder: self.theme.colors.support.support,
            selectedBorder: self.theme.colors.support.support,
            content: self.theme.colors.support.support,
            selectedContent: self.theme.colors.support.support,
            background: ColorTokenDefault.clear,
            pressedBackground: self.theme.colors.support.support.opacity(self.theme.dims.dim5),
            selectedBackground: self.theme.colors.support.supportContainer
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_surface_intent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .surface)

        let expectedColors = ChipStateColors(
            border: self.theme.colors.base.onSurface,
            pressedBorder: self.theme.colors.base.onSurface,
            selectedBorder: self.theme.colors.base.onSurface,
            content: self.theme.colors.base.onSurface,
            selectedContent: self.theme.colors.base.onSurface,
            background: ColorTokenDefault.clear,
            pressedBackground: self.theme.colors.base.onSurface.opacity(self.theme.dims.dim5),
            selectedBackground: self.theme.colors.base.surface
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }
}
