//
//  SliderGetColorsUseCaseTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSlider
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Slider Get Colors UseCase Tests")
struct SliderGetColorsUseCaseTests {

    // MARK: - Private properties

    private let sut: SliderGetColorsUseCase
    private let theme: ThemeGeneratedMock

    // MARK: - Setup

    init() {
        self.sut = SliderGetColorsUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    @Test("Execute accent")
    func executeAccent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .accent)

        // THEN
        #expect(result.tintColorToken.equals(self.theme.colors.accent.accent))
        #expect(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test("Execute main")
    func executeMain() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .main)

        // THEN
        #expect(result.tintColorToken.equals(self.theme.colors.main.main))
        #expect(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    // MARK: - Tests for deprecated intents

    @Test("Execute info")
    func executeInfo() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .info)

        // THEN
        #expect(result.tintColorToken.equals(self.theme.colors.feedback.info))
        #expect(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test("Execute neutral")
    func executeNeutral() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .neutral)

        // THEN
        #expect(result.tintColorToken.equals(self.theme.colors.feedback.neutral))
        #expect(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test("Execute support")
    func executeSupport() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .support)

        // THEN
        #expect(result.tintColorToken.equals(self.theme.colors.support.support))
        #expect(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test("Execute alert")
    func executeAlert() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .alert)

        // THEN
        #expect(result.tintColorToken.equals(self.theme.colors.feedback.alert))
        #expect(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test("Execute error")
    func executeError() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .error)

        // THEN
        #expect(result.tintColorToken.equals(self.theme.colors.feedback.error))
        #expect(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test("Execute success")
    func executeSuccess() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .success)

        // THEN
        #expect(result.tintColorToken.equals(self.theme.colors.feedback.success))
        #expect(result.titleColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.rangeValuesColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }
}
