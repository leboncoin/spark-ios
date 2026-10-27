//
//  CircularMeterToken+ColorsTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCircularMeter
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct CircularMeterTokenColorsTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: CircularMeterToken.Colors {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func contentShouldReturnOnSurfaceWithDim1() {
        let expected = self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)

        #expect(self.token.content.equals(expected))
    }

    @Test
    func iconShouldReturnFeedbackNeutral() {
        #expect(self.token.icon.equals(self.theme.colors.feedback.neutral))
    }

    @Test
    func valueShouldReturnOnSurface() {
        #expect(self.token.value.equals(self.theme.colors.base.onSurface))
    }

    @Test
    func indicatorShouldReturnIntentColor() {
        let colors = self.theme.colors
        let expected: [(CircularMeterIntent, any ColorToken)] = [
            (.alert, colors.feedback.alert),
            (.error, colors.feedback.error),
            (.info, colors.feedback.info),
            (.main, colors.main.main),
            (.success, colors.feedback.success),
            (.support, colors.support.support)
        ]

        for (intent, color) in expected {
            #expect(self.token.indicator(intent: intent).equals(color), "Wrong color for \(intent)")
        }
    }

    @Test(arguments: CircularMeterIntent.allCases)
    func trackShouldReturnIndicatorWithDim4(intent: CircularMeterIntent) {
        let expected = self.token.indicator(intent: intent).opacity(self.theme.dims.dim4)

        #expect(self.token.track(intent: intent).equals(expected))
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = CircularMeterToken.Colors(theme: self.theme)
        let rhs = CircularMeterToken.Colors(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = CircularMeterToken.Colors(theme: self.theme)
        let rhs = CircularMeterToken.Colors(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
