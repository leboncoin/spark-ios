//
//  EnvironmentTheme+CircularMeterTokenTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCircularMeter
@testable import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct EnvironmentThemeCircularMeterTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var environmentTheme: EnvironmentTheme {
        return .init(value: self.theme)
    }

    // MARK: - Tests

    @Test("Colors should return circular meter colors")
    func colorsShouldReturnCircularMeterColors() {
        #expect(self.environmentTheme.colors == self.theme.component.circularMeter.colors)
    }

    @Test("Layout should return circular meter layout")
    func layoutShouldReturnCircularMeterLayout() {
        #expect(self.environmentTheme.layout == self.theme.component.circularMeter.layout)
    }

    @Test("Typography should return circular meter typography")
    func typographyShouldReturnCircularMeterTypography() {
        #expect(self.environmentTheme.typography == self.theme.component.circularMeter.typography)
    }

    @Test("Content should return circular meter content")
    func contentShouldReturnCircularMeterContent() {
        #expect(self.environmentTheme.content == self.theme.component.circularMeter.content)
    }

    @Test("Size should return circular meter size")
    func sizeShouldReturnCircularMeterSize() {
        #expect(self.environmentTheme.size == self.theme.component.circularMeter.size)
    }
}
