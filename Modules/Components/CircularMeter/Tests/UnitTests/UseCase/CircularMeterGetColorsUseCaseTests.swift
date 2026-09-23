//
//  CircularMeterGetColorsUseCaseTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentCircularMeter
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Circular Meter Get Colors Use Case Tests")
struct CircularMeterGetColorsUseCaseTests {

    // MARK: - Private properties

    private let sut = CircularMeterGetColorsUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute with alert intent")
    func executeAlert() {
        // GIVEN
        let expectedIndicatorColor = self.theme.colors.feedback.alert

        // WHEN
        let result = self.sut.execute(theme: self.theme, intent: .alert)

        // THEN
        #expect(result.trackColorToken.equals(expectedIndicatorColor.opacity(self.theme.dims.dim4)))
        #expect(result.indicatorColorToken.equals(expectedIndicatorColor))
        #expect(result.iconColorToken.equals(self.theme.colors.feedback.neutral))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.contentColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test("Execute with error intent")
    func executeError() {
        // GIVEN
        let expectedIndicatorColor = self.theme.colors.feedback.error

        // WHEN
        let result = self.sut.execute(theme: self.theme, intent: .error)

        // THEN
        #expect(result.trackColorToken.equals(expectedIndicatorColor.opacity(self.theme.dims.dim4)))
        #expect(result.indicatorColorToken.equals(expectedIndicatorColor))
        #expect(result.iconColorToken.equals(self.theme.colors.feedback.neutral))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.contentColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test("Execute with info intent")
    func executeInfo() {
        // GIVEN
        let expectedIndicatorColor = self.theme.colors.feedback.info

        // WHEN
        let result = self.sut.execute(theme: self.theme, intent: .info)

        // THEN
        #expect(result.trackColorToken.equals(expectedIndicatorColor.opacity(self.theme.dims.dim4)))
        #expect(result.indicatorColorToken.equals(expectedIndicatorColor))
        #expect(result.iconColorToken.equals(self.theme.colors.feedback.neutral))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.contentColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test("Execute with main intent")
    func executeMain() {
        // GIVEN
        let expectedIndicatorColor = self.theme.colors.main.main

        // WHEN
        let result = self.sut.execute(theme: self.theme, intent: .main)

        // THEN
        #expect(result.trackColorToken.equals(expectedIndicatorColor.opacity(self.theme.dims.dim4)))
        #expect(result.indicatorColorToken.equals(expectedIndicatorColor))
        #expect(result.iconColorToken.equals(self.theme.colors.feedback.neutral))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.contentColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test("Execute with success intent")
    func executeSuccess() {
        // GIVEN
        let expectedIndicatorColor = self.theme.colors.feedback.success

        // WHEN
        let result = self.sut.execute(theme: self.theme, intent: .success)

        // THEN
        #expect(result.trackColorToken.equals(expectedIndicatorColor.opacity(self.theme.dims.dim4)))
        #expect(result.indicatorColorToken.equals(expectedIndicatorColor))
        #expect(result.iconColorToken.equals(self.theme.colors.feedback.neutral))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.contentColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }

    @Test("Execute with support intent")
    func executeSupport() {
        // GIVEN
        let expectedIndicatorColor = self.theme.colors.support.support

        // WHEN
        let result = self.sut.execute(theme: self.theme, intent: .support)

        // THEN
        #expect(result.trackColorToken.equals(expectedIndicatorColor.opacity(self.theme.dims.dim4)))
        #expect(result.indicatorColorToken.equals(expectedIndicatorColor))
        #expect(result.iconColorToken.equals(self.theme.colors.feedback.neutral))
        #expect(result.valueColorToken.equals(self.theme.colors.base.onSurface))
        #expect(result.contentColorToken.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)))
    }
}
