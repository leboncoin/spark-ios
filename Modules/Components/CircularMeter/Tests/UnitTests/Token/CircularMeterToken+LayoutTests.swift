//
//  CircularMeterToken+LayoutTests.swift
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

struct CircularMeterTokenLayoutTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: CircularMeterToken.Layout {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func paddingShouldReturnSpacingSmall() {
        #expect(self.token.padding == self.theme.layout.spacing.small)
    }

    @Test
    func spacingShouldReturnSpacingMedium() {
        #expect(self.token.spacing == self.theme.layout.spacing.medium)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = CircularMeterToken.Layout(theme: self.theme)
        let rhs = CircularMeterToken.Layout(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = CircularMeterToken.Layout(theme: self.theme)
        let rhs = CircularMeterToken.Layout(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
