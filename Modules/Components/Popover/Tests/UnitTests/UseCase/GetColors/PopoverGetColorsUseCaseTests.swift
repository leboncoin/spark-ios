//
//  PopoverGetColorsUseCaseTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by louis.borlee on 25/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentPopover
@_spi(SI_SPI) @testable import SparkComponentPopoverTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Popover Get Colors UseCase Tests")
struct PopoverGetColorsUseCaseTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = PopoverGetColorsUseCase()

    // MARK: - Tests

    @Test("Execute with is liquid glass true surface")
    func executeWithIsLiquidGlassTrueSurface() {
        // WHEN
        let colors = self.useCase.execute(colors: self.theme.colors, intent: .surface, isLiquidGlass: true)

        // THEN
        #expect(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .surface")
        #expect(colors.foreground.equals(self.theme.colors.base.onSurface), "Wrong foreground color for intent .surface")
    }

    @Test("Execute with is liquid glass false surface")
    func executeWithIsLiquidGlassFalseSurface() {
        // WHEN
        let colors = self.useCase.execute(colors: self.theme.colors, intent: .surface, isLiquidGlass: false)

        // THEN
        #expect(colors.background.equals(self.theme.colors.base.surface), "Wrong background color for intent .surface")
        #expect(colors.foreground.equals(self.theme.colors.base.onSurface), "Wrong foreground color for intent .surface")
    }

    @Test("Execute with is liquid glass true main")
    func executeWithIsLiquidGlassTrueMain() {
        // WHEN
        let colors = self.useCase.execute(colors: self.theme.colors, intent: .main, isLiquidGlass: true)

        // THEN
        #expect(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .main")
        #expect(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .main")
    }

    @Test("Execute with is liquid glass false main")
    func executeWithIsLiquidGlassFalseMain() {
        // WHEN
        let colors = self.useCase.execute(colors: self.theme.colors, intent: .main, isLiquidGlass: false)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .main")
        #expect(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .main")
    }

    @available(*, deprecated, message: "Testing deprecated intent .support")
    @Test("Execute with is liquid glass true support")
    func executeWithIsLiquidGlassTrueSupport() {
        // WHEN
        let colors = self.useCase.execute(colors: self.theme.colors, intent: .support, isLiquidGlass: true)

        // THEN
        #expect(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .support")
        #expect(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .support")
    }

    @available(*, deprecated, message: "Testing deprecated intent .support")
    @Test("Execute with is liquid glass false support")
    func executeWithIsLiquidGlassFalseSupport() {
        // WHEN
        let colors = self.useCase.execute(colors: self.theme.colors, intent: .support, isLiquidGlass: false)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .support")
        #expect(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .support")
    }

    // MARK: - Execute New Tests

    @Test("Execute new surface")
    func executeNewSurface() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .surface)

        // THEN
        #expect(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .surface")
        #expect(colors.foreground.equals(self.theme.colors.base.onSurface), "Wrong foreground color for intent .surface")
    }

    @Test("Execute new main")
    func executeNewMain() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .main)

        // THEN
        #expect(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .main")
        #expect(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .main")
    }

    @Test("Execute new accent")
    func executeNewAccent() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .accent)

        // THEN
        #expect(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .accent")
        #expect(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .accent")
    }

    @available(*, deprecated, message: "Testing deprecated intent .support")
    @Test("Execute new support")
    func executeNewSupport() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .support)

        // THEN
        #expect(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .support")
        #expect(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .support")
    }

    @available(*, deprecated, message: "Testing deprecated intent .success")
    @Test("Execute new success")
    func executeNewSuccess() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .success)

        // THEN
        #expect(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .success")
        #expect(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .success")
    }

    @available(*, deprecated, message: "Testing deprecated intent .alert")
    @Test("Execute new alert")
    func executeNewAlert() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .alert)

        // THEN
        #expect(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .alert")
        #expect(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .alert")
    }

    @available(*, deprecated, message: "Testing deprecated intent .error")
    @Test("Execute new error")
    func executeNewError() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .error)

        // THEN
        #expect(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .error")
        #expect(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .error")
    }

    @Test("Execute new info")
    func executeNewInfo() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .info)

        // THEN
        #expect(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .info")
        #expect(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .info")
    }

    @available(*, deprecated, message: "Testing deprecated intent .neutral")
    @Test("Execute new neutral")
    func executeNewNeutral() {
        // WHEN
        let colors = self.useCase.executeNew(colors: self.theme.colors, intent: .neutral)

        // THEN
        #expect(colors.background.equals(ColorTokenClear()), "Wrong background color for intent .neutral")
        #expect(colors.foreground.equals(self.theme.colors.feedback.info), "Wrong foreground color for intent .neutral")
    }

    // MARK: - Old iOS version Tests

    @Test("Execute old ios version surface")
    func executeOldIosVersionSurface() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .surface)

        // THEN
        #expect(colors.background.equals(self.theme.colors.base.surface), "Wrong background color for intent .surface")
        #expect(colors.foreground.equals(self.theme.colors.base.onSurface), "Wrong foreground color for intent .surface")
    }

    @Test("Execute old ios version main")
    func executeOldIosVersionMain() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .main)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .main")
        #expect(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .main")
    }

    @Test("Execute old ios version accent")
    func executeOldIosVersionAccent() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .accent)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .accent")
        #expect(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .accent")
    }

    @available(*, deprecated, message: "Testing deprecated intent .support")
    @Test("Execute old ios version support")
    func executeOldIosVersionSupport() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .support)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .support")
        #expect(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .support")
    }

    @available(*, deprecated, message: "Testing deprecated intent .success")
    @Test("Execute old ios version success")
    func executeOldIosVersionSuccess() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .success)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .success")
        #expect(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .success")
    }

    @available(*, deprecated, message: "Testing deprecated intent .alert")
    @Test("Execute old ios version alert")
    func executeOldIosVersionAlert() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .alert)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .alert")
        #expect(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .alert")
    }

    @available(*, deprecated, message: "Testing deprecated intent .error")
    @Test("Execute old ios version error")
    func executeOldIosVersionError() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .error)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .error")
        #expect(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .error")
    }

    @Test("Execute old ios version info")
    func executeOldIosVersionInfo() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .info)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .info")
        #expect(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .info")
    }

    @available(*, deprecated, message: "Testing deprecated intent .neutral")
    @Test("Execute old ios version neutral")
    func executeOldIosVersionNeutral() {
        // WHEN
        let colors = self.useCase.executeOldIosVersion(colors: self.theme.colors, intent: .neutral)

        // THEN
        #expect(colors.background.equals(self.theme.colors.feedback.infoContainer), "Wrong background color for intent .neutral")
        #expect(colors.foreground.equals(self.theme.colors.feedback.onInfoContainer), "Wrong foreground color for intent .neutral")
    }
}
