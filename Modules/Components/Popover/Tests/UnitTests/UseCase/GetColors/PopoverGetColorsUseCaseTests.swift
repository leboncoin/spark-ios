//
//  PopoverGetColorsUseCaseTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by louis.borlee on 25/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentPopover
@_spi(SI_SPI) @testable import SparkComponentPopoverTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class PopoverGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = PopoverGetColorsUseCase()

    // MARK: - Tests

    func test_execute_withIsLiquidGlassTrue_surface() {
        // WHEN
        let colors = self.useCase.execute(colors: self.theme.colors, intent: .surface, isLiquidGlass: true)

        // THEN
        XCTAssertTrue(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .surface")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.base.onSurface), "Wrong foreground color for intent .surface")
    }

    func test_execute_withIsLiquidGlassFalse_surface() {
        // WHEN
        let colors = self.useCase.execute(colors: self.theme.colors, intent: .surface, isLiquidGlass: false)

        // THEN
        XCTAssertTrue(colors.background.equals(self.theme.colors.base.surface), "Wrong background color for intent .surface")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.base.onSurface), "Wrong foreground color for intent .surface")
    }

    func test_execute_withIsLiquidGlassTrue_main() {
        // WHEN
        let colors = self.useCase.execute(colors: self.theme.colors, intent: .main, isLiquidGlass: true)

        // THEN
        XCTAssertTrue(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .main")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .main")
    }

    func test_execute_withIsLiquidGlassFalse_main() {
        // WHEN
        let colors = self.useCase.execute(colors: self.theme.colors, intent: .main, isLiquidGlass: false)

        // THEN
        XCTAssertTrue(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .main")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .main")
    }

    @available(*, deprecated, message: "Testing deprecated intent .support")
    func test_execute_withIsLiquidGlassTrue_support() {
        // WHEN
        let colors = self.useCase.execute(colors: self.theme.colors, intent: .support, isLiquidGlass: true)

        // THEN
        XCTAssertTrue(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .support")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .support")
    }

    @available(*, deprecated, message: "Testing deprecated intent .support")
    func test_execute_withIsLiquidGlassFalse_support() {
        // WHEN
        let colors = self.useCase.execute(colors: self.theme.colors, intent: .support, isLiquidGlass: false)

        // THEN
        XCTAssertTrue(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .support")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .support")
    }

    // MARK: - Execute New Tests

    func test_executeNew_surface() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .surface)

        // THEN
        XCTAssertTrue(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .surface")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.base.onSurface), "Wrong foreground color for intent .surface")
    }

    func test_executeNew_main() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .main)

        // THEN
        XCTAssertTrue(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .main")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .main")
    }

    func test_executeNew_accent() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .accent)

        // THEN
        XCTAssertTrue(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .accent")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .accent")
    }

    @available(*, deprecated, message: "Testing deprecated intent .support")
    func test_executeNew_support() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .support)

        // THEN
        XCTAssertTrue(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .support")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .support")
    }

    @available(*, deprecated, message: "Testing deprecated intent .success")
    func test_executeNew_success() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .success)

        // THEN
        XCTAssertTrue(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .success")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .success")
    }

    @available(*, deprecated, message: "Testing deprecated intent .alert")
    func test_executeNew_alert() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .alert)

        // THEN
        XCTAssertTrue(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .alert")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .alert")
    }

    @available(*, deprecated, message: "Testing deprecated intent .error")
    func test_executeNew_error() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .error)

        // THEN
        XCTAssertTrue(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .error")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .error")
    }

    func test_executeNew_info() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .info)

        // THEN
        XCTAssertTrue(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .info")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .info")
    }

    @available(*, deprecated, message: "Testing deprecated intent .neutral")
    func test_executeNew_neutral() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .neutral)

        // THEN
        XCTAssertTrue(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .neutral")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .neutral")
    }

    // MARK: - Old iOS version Tests

    func test_executeOldIosVersion_surface() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .surface)

        // THEN
        XCTAssertTrue(colors.background.equals(self.theme.colors.base.surface), "Wrong background color for intent .surface")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.base.onSurface), "Wrong foreground color for intent .surface")
    }

    func test_executeOldIosVersion_main() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .main)

        // THEN
        XCTAssertTrue(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .main")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .main")
    }

    func test_executeOldIosVersion_accent() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .accent)

        // THEN
        XCTAssertTrue(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .accent")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .accent")
    }

    @available(*, deprecated, message: "Testing deprecated intent .support")
    func test_executeOldIosVersion_support() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .support)

        // THEN
        XCTAssertTrue(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .support")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .support")
    }

    @available(*, deprecated, message: "Testing deprecated intent .success")
    func test_executeOldIosVersion_success() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .success)

        // THEN
        XCTAssertTrue(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .success")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .success")
    }

    @available(*, deprecated, message: "Testing deprecated intent .alert")
    func test_executeOldIosVersion_alert() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .alert)

        // THEN
        XCTAssertTrue(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .alert")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .alert")
    }

    @available(*, deprecated, message: "Testing deprecated intent .error")
    func test_executeOldIosVersion_error() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .error)

        // THEN
        XCTAssertTrue(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .error")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .error")
    }

    func test_executeOldIosVersion_info() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .info)

        // THEN
        XCTAssertTrue(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .info")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .info")
    }

    @available(*, deprecated, message: "Testing deprecated intent .neutral")
    func test_executeOldIosVersion_neutral() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .neutral)

        // THEN
        XCTAssertTrue(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .neutral")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .neutral")
    }
}
