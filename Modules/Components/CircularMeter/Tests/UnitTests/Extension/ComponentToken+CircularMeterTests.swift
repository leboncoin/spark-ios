//
//  ComponentToken+CircularMeterTests.swift
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

struct ComponentTokenCircularMeterTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func circularMeterShouldReturnTokenFromTheme() {
        // GIVEN
        let componentToken = ComponentToken(theme: self.theme)

        // WHEN
        let token = componentToken.circularMeter

        // THEN
        #expect(token == CircularMeterToken(theme: self.theme))
    }

    @Test
    func circularMeterFromThemeComponentShouldReturnTokenFromTheme() {
        // GIVEN / WHEN
        let token = self.theme.component.circularMeter

        // THEN
        #expect(token == CircularMeterToken(theme: self.theme))
    }

    @Test
    func circularMeterWithDifferentThemeShouldNotReturnTokenFromTheme() {
        // GIVEN
        let componentToken = ComponentToken(theme: ThemeGeneratedMock.mocked2())

        // WHEN
        let token = componentToken.circularMeter

        // THEN
        #expect(token != CircularMeterToken(theme: self.theme))
    }
}
