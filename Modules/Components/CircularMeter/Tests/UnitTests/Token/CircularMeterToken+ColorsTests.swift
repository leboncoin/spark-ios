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

    @Test("Content should return on surface with dim 1")
    func contentShouldReturnOnSurfaceWithDim1() {
        let expected = self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)

        #expect(self.token.content.equals(expected))
    }

    @Test("Icon should return feedback neutral")
    func iconShouldReturnFeedbackNeutral() {
        #expect(self.token.icon.equals(self.theme.colors.feedback.neutral))
    }

    @Test("Value should return on surface")
    func valueShouldReturnOnSurface() {
        #expect(self.token.value.equals(self.theme.colors.base.onSurface))
    }

    @Test("Indicator should return intent color")
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

    @Test("Track should return indicator with dim 4", arguments: CircularMeterIntent.allCases)
    func trackShouldReturnIndicatorWithDim4(intent: CircularMeterIntent) {
        let expected = self.token.indicator(intent: intent).opacity(self.theme.dims.dim4)

        #expect(self.token.track(intent: intent).equals(expected))
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = CircularMeterToken.Colors(theme: self.theme)
        let rhs = CircularMeterToken.Colors(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = CircularMeterToken.Colors(theme: self.theme)
        let rhs = CircularMeterToken.Colors(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
